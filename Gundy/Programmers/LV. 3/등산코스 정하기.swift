struct Heap<T> {
    private(set) var box: [T]
    private var condition: (T, T) -> Bool
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }
    
    init(_ elements: [T] = [], _ condition: @escaping (T, T) -> Bool) {
        box = elements
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

func solution(_ n:Int, _ paths:[[Int]], _ gates:[Int], _ summits:[Int]) -> [Int] {
    var nodes = Array(repeating: [(Int, Int)](), count: n + 1)
    let summits = Set(summits)
    for path in paths {
        nodes[path[0]].append((path[1], path[2]))
        nodes[path[1]].append((path[0], path[2]))
    }
    func Dijkstra() -> [Int] {
        var heap = Heap<(Int, Int)> { $0.0 < $1.0 }
        var distances = Array(repeating: Int.max, count: n + 1)
        for gate in gates {
            heap.insert((0, gate))
            distances[gate] = 0
        }
        while heap.isEmpty == false {
            let current = heap.removeFirst()!
            guard distances[current.1] >= current.0 else { continue }
            for nextData in nodes[current.1] {
                let totalCost = max(current.0, nextData.1)
                if distances[nextData.0] > totalCost {
                    distances[nextData.0] = totalCost
                    if summits.contains(nextData.0) { continue }
                    heap.insert((totalCost, nextData.0))
                }
            }
        }
        return distances
    }
    let distances = Dijkstra()
    var result = [Int.max, Int.max]
    for summit in summits.sorted() {
        if result[1] > distances[summit] {
            result = [summit, distances[summit]]
        } else if result[1] == distances[summit], result[0] > summit {
            result = [summit, distances[summit]]
        }
    }
    return result
}
