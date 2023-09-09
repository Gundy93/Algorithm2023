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
    let summits = Set(summits)
    var next = [Int: [(point: Int, intensity: Int)]]()
    for path in paths {
        next[path[0], default: []].append((path[1], path[2]))
        next[path[1], default: []].append((path[0], path[2]))
    }
    var intensities = Array(repeating: Int.max, count: n + 1)
    var heap = Heap([(point: Int, intensity: Int)]()) { $0.intensity < $1.intensity }
    for gate in gates {
        next[gate, default: []].forEach({ heap.insert($0) })
    }
    while heap.isEmpty == false {
        let current = heap.removeFirst()!
        guard current.intensity <= intensities[current.point] else { continue }
        for next in next[current.point, default: []] {
            let intensity = max(next.intensity, current.intensity)
            if intensities[next.point] > intensity {
                intensities[next.point] = intensity
                guard summits.contains(next.point) == false else { continue }
                heap.insert((next.point, intensity))
            }
        }
    }
    var result = [Int.max, Int.max]
    for summit in summits.sorted() {
        if intensities[summit] < result[1] {
            result = [summit, intensities[summit]]
        }
    }
    return result
}
