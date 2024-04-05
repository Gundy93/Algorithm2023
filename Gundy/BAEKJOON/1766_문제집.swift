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

func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var previous = Array(repeating: Set<Int>(), count: input[0]+1)
    var next = [Int : Set<Int>]()
    var heap = Heap<Int>(<)
    
    for _ in 0..<input[1] {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        
        previous[link[1]].insert(link[0])
        next[link[0], default: []].insert(link[1])
    }
    
    for question in 1...input[0] where previous[question].isEmpty {
        heap.insert(question)
    }
    
    var result = [String]()
    
    while let question = heap.removeFirst() {
        result.append(String(question))
        
        for next in next[question, default: []] {
            previous[next].remove(question)
            
            if previous[next].isEmpty { heap.insert(next) }
        }
    }
    
    print(result.joined(separator: " "))
}

solution()
