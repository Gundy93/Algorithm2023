struct Heap<T> {
    private var box: [T]
    private var condition: (T, T) -> Bool
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }
    
    init(_ elements: [T] = [], _ condition: @escaping (T, T) -> Bool) {
        box = elements
        self.condition = condition
    }
    
    private func getSuperIndex(_ index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func getLeftSubIndex(_ index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func getRightSubIndex(_ index: Int) -> Int {
        return index * 2 + 2
    }
    
    mutating func insert(_ newElement: T) {
        box.append(newElement)
        guard count > 1 else { return }
        var index = count - 1
        while index > 0 {
            let superIndex = getSuperIndex(index)
            guard condition(box[index], box[superIndex]) else { return }
            box.swapAt(superIndex, index)
            index = superIndex
        }
    }
    
    mutating func removeFirst() -> T? {
        guard box.count > 1 else {
            return box.popLast()
        }
        box.swapAt(0, count - 1)
        let element = box.removeLast()
        var index = 0
        while index < count - 1 {
            var superIndex = index
            let leftSubIndex = getLeftSubIndex(index)
            let rightSubIndex = getRightSubIndex(index)
            if leftSubIndex < count, condition(box[leftSubIndex], box[index]) {
                superIndex = leftSubIndex
            }
            if rightSubIndex < count, condition(box[rightSubIndex], box[superIndex]) {
                superIndex = rightSubIndex
            }
            guard index != superIndex else { break }
            box.swapAt(index, superIndex)
            index = superIndex
        }
        return element
    }
}

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var list = [String: (Heap<(Int, Int)>, Int)]()
    var result = [Int]()
    for number in 0...genres.count - 1 {
        let genre = genres[number]
        let count = plays[number]
        list[genre, default: (Heap<(Int, Int)>() { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 > $1.1 }, 0)].0.insert((number, count))
        list[genre]!.1 += count
    }
    for genre in list.keys.sorted(by: { list[$0]!.1 > list[$1]!.1 }) {
        var heap = list[genre]!.0
        guard let firstNumber = heap.removeFirst()?.0 else { continue }
        result.append(firstNumber)
        guard let secondNumber = heap.removeFirst()?.0 else { continue }
        result.append(secondNumber)
    }
    return result
}
