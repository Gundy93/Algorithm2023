import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    let jobs = jobs.sorted { $0[0] == $1[0] ? $0[1] < $1[1] : $0[0] < $1[0] }
    var result = 0
    var now = 0
    var heap = Heap<(Int, Int)>() { $0.1 < $1.1 }
    
    for job in jobs {
        while now < job[0],
              let task = heap.removeFirst() {
            now = max(now, task.0)
            now += task.1
            result += now - task.0
        }
        
        heap.insert((job[0], job[1]))
    }
    
    while let task = heap.removeFirst() {
        now = max(now, task.0)
        now += task.1
        result += now - task.0
    }
    
    return result / jobs.count
}

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
