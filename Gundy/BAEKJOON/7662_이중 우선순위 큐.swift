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

let count = Int(readLine()!)!
var result = ""

for _ in 0..<count {
    let count = Int(readLine()!)!
    var maxHeap = Heap<(Int, Int)>() { $0.1 > $1.1 }
    var minHeap = Heap<(Int, Int)>() { $0.1 < $1.1 }
    var removedIndices = Set<Int>()
    
    for index in 0..<count {
        let input = readLine()!.split(separator: " ").map(String.init)
        
        switch input[0] {
        case "I":
            let newElement = (index, Int(input[1])!)
            
            maxHeap.insert(newElement)
            minHeap.insert(newElement)
        default:
            if input[1] == "1" {
                while let max = maxHeap.removeFirst() {
                    if removedIndices.contains(max.0) == false {
                        removedIndices.insert(max.0)
                        break
                    }
                }
            } else {
                while let min = minHeap.removeFirst() {
                    if removedIndices.contains(min.0) == false {
                        removedIndices.insert(min.0)
                        break
                    }
                }
            }
        }
    }
    
    var maxValue: Int? = nil
    var minValue: Int? = nil
    
    while let max = maxHeap.removeFirst() {
        if removedIndices.contains(max.0) == false {
            maxValue = max.1
            break
        }
    }
    
    while let min = minHeap.removeFirst() {
        if removedIndices.contains(min.0) == false {
            minValue = min.1
            break
        }
    }
    
    if let maxValue = maxValue,
       let minValue = minValue {
        result += String(maxValue) + " " + String(minValue) + "\n"
    } else {
        result += "EMPTY" + "\n"
    }
}

print(result)
