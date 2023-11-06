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
    let height = input[0]
    let width = input[1]
    let numberOfSquares = input[2]
    var paper = Array(repeating: Array(repeating: true, count: width), count: height)
    for _ in 1...numberOfSquares {
        let square = readLine()!.split(separator: " ").compactMap({ Int($0) })
        for row in square[1]..<square[3] {
            for column in square[0]..<square[2] {
                paper[row][column] = false
            }
        }
    }
    var result = [Int]()
    var visited = Array(repeating: Array(repeating: false, count: width), count: height)
    for row in 0..<height {
        for column in 0..<width {
            guard visited[row][column] == false,
                  paper[row][column] else { continue }
            var temporary = 0
            var needVisit = [(row, column)]
            while needVisit.isEmpty == false {
                let point = needVisit.removeLast()
                guard visited[point.0][point.1] == false else { continue }
                visited[point.0][point.1] = true
                temporary += 1
                for (x, y) in zip([0, 0, 1, -1],
                                  [1, -1, 0, 0]) {
                    if paper[safe: point.0 + x]?[safe: point.1 + y] == true,
                       visited[point.0 + x][point.1 + y] == false {
                        needVisit.append((point.0 + x, point.1 + y))
                    }
                }
            }
            result.append(temporary)
        }
    }
    print(result.count)
    print(result.sorted().map({ "\($0)" }).joined(separator: " "))
}

solution()
