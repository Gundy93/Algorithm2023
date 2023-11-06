extension Array {
    subscript(safe index: Index) -> Element? {
        guard index >= 0,
              index < count else { return nil }
        return self[index]
    }
}

struct Queue<T> {
    private var left = [T]()
    private var right: [T]
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }

    init(_ elements: [T] = []) {
        right = elements
    }

    mutating func enqueue(_ element: T) {
        right.append(element)
    }

    mutating func dequeue() -> T? {
        if left.isEmpty {
            if right.isEmpty {
                return nil
            }
            left = right.reversed()
            right = []
        }
        return left.removeLast()
    }
}

func solution() {
    let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let row = input[1]
    let column = input[0]
    let height = input[2]
    var box = [[[Int]]]()
    for _ in 1...height {
        var board = [[Int]]()
        for _ in 1...row {
            board.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
        }
        box.append(board)
    }
    var needVisit = Queue<(x: Int, y: Int, z: Int)>()
    for x in 0..<height {
        for y in 0..<row {
            for z in 0..<column {
                if box[x][y][z] == 1 {
                    needVisit.enqueue((x, y, z))
                }
            }
        }
    }
    while needVisit.isEmpty == false {
        let point = needVisit.dequeue()!
        for (x, (y, z)) in zip([0, 0, 0, 0, 1, -1], zip([0, 0, 1, -1, 0, 0], [1, -1, 0, 0, 0, 0])) {
            guard box[safe: point.x + x]?[safe: point.y + y]?[safe: point.z + z] == 0 else { continue }
            box[point.x + x][point.y + y][point.z + z] = box[point.x][point.y][point.z] + 1
            needVisit.enqueue((point.x + x, point.y + y, point.z + z))
        }
    }
    let result = box.flatMap({ $0.flatMap({ $0 }) })
    guard result.contains(0) == false else {
        print(-1)
        return
    }
    print(result.sorted().last! - 1)
}

solution()
