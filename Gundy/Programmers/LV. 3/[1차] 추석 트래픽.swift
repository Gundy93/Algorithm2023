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

func solution(_ lines:[String]) -> Int {
    var commands = [(Int, Int)]()
    
    for line in lines {
        let line = line.split(separator: " ").map(String.init)
        let times = line[1].split(separator: ":").compactMap(Double.init)
        let time = times[0]*3600000 + times[1]*60000 + times[2]*1000
        let delay = Double(line[2].dropLast())!*1000
        
        commands.append((Int(time-delay+1), Int(time)))
    }
    
    commands.sort(by: <)
    
    var heap = Heap<(Int, Int)>() { $0.1 < $1.1 }
    var result = 0
    
    for command in commands {
        while let first = heap.first,
              command.0-1000 >= first.1 {
            heap.removeFirst()
        }
        
        heap.insert(command)
        result = max(result, heap.count)
    }
    
    return result
}
