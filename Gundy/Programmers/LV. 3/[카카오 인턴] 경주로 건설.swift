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

enum Direction: CaseIterable {
    case up
    case down
    case left
    case right

    var move: (x: Int, y: Int) {
        switch self {
        case .up:
            return (0, -1)
        case .down:
            return (0, 1)
        case .left:
            return (-1, 0)
        case .right:
            return (1, 0)
        }
    }

    func isConer(_ direction: Direction) -> Bool {
        switch self {
        case .up, .down:
            return direction == .left || direction == .right
        case .left, .right:
            return direction == .up || direction == .down
        }
    }
}

func solution(_ board:[[Int]]) -> Int {
    let length = board.count
    var result = Int.max
    var needVisit: Heap<(x: Int, y: Int, price: Int, direction: Direction?, visited: [[Bool]])> = Heap([(0, 0, 0, nil, Array(repeating: Array(repeating: false, count: length), count: length))]) { return $0.price < $1.price }
    var visited = [[Int]: Int]()
    while needVisit.isEmpty == false {
        let now = needVisit.removeFirst()!
        guard visited[[now.x, now.y]] == nil || visited[[now.x, now.y]]! + 500 >= now.price else { continue }
        if visited[[now.x, now.y]] == nil || visited[[now.x, now.y]]! > now.price {
            visited[[now.x, now.y]] = now.price
        }
        if now.x == length - 1, now.y == length - 1 {
            if result > now.price {
                result = now.price
            }
            continue
        }
        for direction in Direction.allCases {
            let x = now.x + direction.move.x
            let y = now.y + direction.move.y
            guard x >= 0, x < length, y >= 0, y < length, board[x][y] == 0, now.visited[x][y] == false else { continue }
            var visited = now.visited
            visited[x][y] = true
            needVisit.insert((x, y, now.direction?.isConer(direction) == true ? now.price + 600 : now.price + 100, direction, visited))
        }
    }
    return result
}
