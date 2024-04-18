import Foundation

struct Heap<T> {
    private(set) var box: [T] = []
    private var condition: (T, T) -> Bool
    var first: T? { box.first }
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }
    
    init(_ condition: @escaping (T, T) -> Bool) {
        self.condition = condition
    }
    
    private func getSuperIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func getLeftIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func getRightIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    mutating func insert(_ newElement: T) {
        box.append(newElement)
        guard count > 1 else { return }
        var index = count - 1
        while index > 0 {
            let superIndex = getSuperIndex(of: index)
            guard condition(box[index], box[superIndex]) else { return }
            box.swapAt(superIndex, index)
            index = superIndex
        }
    }
    
    @discardableResult
    mutating func removeFirst() -> T? {
        guard count > 1 else { return box.popLast() }
        box.swapAt(0, count - 1)
        let element = box.removeLast()
        var index = 0
        while index < count - 1 {
            var superIndex = index
            let leftIndex = getLeftIndex(of: index)
            let rightIndex = getRightIndex(of: index)
            if leftIndex < count, condition(box[leftIndex], box[superIndex]) {
                superIndex = leftIndex
            }
            if rightIndex < count, condition(box[rightIndex], box[superIndex]) {
                superIndex = rightIndex
            }
            guard index != superIndex else { break }
            box.swapAt(index, superIndex)
            index = superIndex
        }
        return element
    }
}

func solution(_ operations:[String]) -> [Int] {
    var minHeap = Heap<[Int]>() { $0[1] < $1[1] }
    var maxHeap = Heap<[Int]>() { $0[1] > $1[1] }
    var removed = Array(repeating: false, count: operations.count)
    
    for index in 0..<operations.count {
        let operation = operations[index].split(separator: " ").map(String.init)
        let number = Int(operation[1])!
        
        if operation[0] == "I" {
            minHeap.insert([index, number])
            maxHeap.insert([index, number])
        } else if number == 1 {
            while let max = maxHeap.removeFirst() {
                if removed[max[0]] == false {
                    removed[max[0]] = true
                    break
                }
            }
        } else {
            while let min = minHeap.removeFirst() {
                if removed[min[0]] == false {
                    removed[min[0]] = true
                    break
                }
            }
        }
    }
    
    while let first = maxHeap.first, removed[first[0]] {
        maxHeap.removeFirst()
    }
    
    while let first = minHeap.first, removed[first[0]] {
        minHeap.removeFirst()
    }
    
    return [maxHeap.removeFirst()?[1] ?? 0, minHeap.removeFirst()?[1] ?? 0]
}
