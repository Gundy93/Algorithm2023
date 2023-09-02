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

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ r:Int, _ c:Int, _ k:Int) -> String {
    var result = "impossible"
    guard (abs(r - x) + abs(c - y)) % 2 == k % 2 else { return result }
    var heap = Heap([(x, y, "")]) { $0.2 < $1.2 }
    while heap.isEmpty == false {
        let now = heap.removeFirst()!
        guard now.0 >= 1, now.0 <= n, now.1 >= 1, now.1 <= m, abs(r - now.0) + abs(c - now.1) <= k - now.2.count else { continue }
        guard now.2.count < k else {
            guard now.0 == r, now.1 == c else { continue }
            result = now.2
            break
        }
        heap.insert((now.0 + 1, now.1, now.2 + "d"))
        heap.insert((now.0, now.1 - 1, now.2 + "l"))
        heap.insert((now.0, now.1 + 1, now.2 + "r"))
        heap.insert((now.0 - 1, now.1, now.2 + "u"))
    }
    return result
}
