extension Array {
    subscript(safe index: Int) -> Element? {
        guard self.count > index && index >= 0 else {
            return nil
        }
        return self[index]
    }
}

struct Queue<T> {
    private var left: [T] = []
    private var right: [T] = []
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    mutating func enqueue(_ value: T) {
        right.append(value)
    }
    
    mutating func dequeue() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right = []
        }
        return left.popLast()
    }
}

func solution() {
    let size: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    var war: [[String]] = []
    for _ in 1...size[1] {
        let row: [String] = readLine()!.map({ String($0) })
        war.append(row)
    }
    print(checkPower(for: "W", in: war), checkPower(for: "B", in: war))
}

func checkPower(for color: String, in war: [[String]]) -> Int {
    let size: (width: Int, height: Int) = (war[0].count, war.count)
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size.width), count: size.height)
    var needVisit: Queue<[Int]> = Queue()
    var result: [Int] = []
    var temporaryCount: Int = 0
    let axisX: [Int] = [0, 0, -1, 1]
    let axisY: [Int] = [-1, 1, 0, 0]
    for x in 0..<size.width {
        for y in 0..<size.height {
            if war[y][x] == color,
               visited[y][x] == false {
                needVisit.enqueue([x, y])
                while needVisit.isEmpty == false {
                    let now: [Int] = needVisit.dequeue()!
                    guard visited[now[1]][now[0]] == false else { continue }
                    visited[now[1]][now[0]] = true
                    temporaryCount += 1
                    for (dx, dy) in zip(axisX, axisY) {
                        if war[safe: now[1] + dy]?[safe: now[0] + dx] == color,
                           visited[now[1] + dy][now[0] + dx] == false {
                            needVisit.enqueue([now[0] + dx, now[1] + dy])
                        }
                    }
                }
                result.append(temporaryCount * temporaryCount)
                temporaryCount = 0
            }
        }
    }
    return result.reduce(0, +)
}

solution()
