struct Heap<T> {
    private var box: [T]
    private var condition: (T, T) -> Bool
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count}

    init(_ elements: [T] = [], _ condition: @escaping (T, T) -> Bool) {
        box = elements
        self.condition = condition
    }

    private func getSuper(_ index: Int) -> Int {
        return (index - 1) / 2
    }

    private func getLeft(_ index: Int) -> Int {
        return index * 2 + 1
    }

    private func getRight(_ index: Int) -> Int {
        return index * 2 + 2
    }

    mutating func insert(_ newElement: T) {
        box.append(newElement)
        guard box.count > 1 else { return }
        var index = count - 1
        while index > 0 {
            let superIndex = getSuper(index)
            guard condition(box[index], box[superIndex]) else { break }
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
            let left = getLeft(index)
            let right = getRight(index)
            if left < count, condition(box[left], box[superIndex]) {
                superIndex = left
            }
            if right < count, condition(box[right], box[superIndex]) {
                superIndex = right
            }
            guard index != superIndex else { break }
            box.swapAt(index, superIndex)
            index = superIndex
        }
        return element
    }
}

func solution(_ jobs:[[Int]]) -> Int {
    let count = jobs.count
    var jobs = jobs.sorted { $0[0] > $1[0] }
    let first = jobs.removeLast()
    var now = first[1] + first[0]
    var result = [first[1]]
    var heap = Heap<[Int]>() { $0[1] == $1[1] ? $0[0] < $1[0] : $0[1] < $1[1] }
    while result.count < count {
        while jobs.isEmpty == false, jobs.last![0] < now {
            heap.insert(jobs.removeLast())
        }
        let next = heap.removeFirst() ?? jobs.removeLast()
        now += next[1]
        result.append(now - next[0])
    }
    return result.reduce(0, +) / result.count
}
