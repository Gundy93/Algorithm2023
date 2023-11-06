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
    var fiber: [[Int]] = []
    for _ in 1...size[0] {
        fiber.append(readLine()!.compactMap({ Int(String($0)) }))
    }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
    var needVisit: Queue<[Int]> = Queue()
    for index in 0..<size[1] {
        if fiber[0][index] == 0 {
            needVisit.enqueue([index, 0])
        }
    }
    guard needVisit.isEmpty == false else {
        print("NO")
        return
    }
    let axisX: [Int] = [0, 0, -1, 1]
    let axisY: [Int] = [-1, 1, 0, 0]
    while needVisit.isEmpty == false {
        let now: [Int] = needVisit.dequeue()!
        let x: Int = now[0]
        let y: Int = now[1]
        if y == size[0] - 1 {
            print("YES")
            return
        }
        guard visited[y][x] == false else { continue }
        visited[y][x] = true
        for (dx, dy) in zip(axisX, axisY) {
            if fiber[safe: y + dy]?[safe: x + dx] == 0 {
                needVisit.enqueue([x + dx, y + dy])
            }
        }
    }
    print("NO")
}

solution()
