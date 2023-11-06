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
    var tomatos: [[Int]] = []
    for _ in 1...size[1] {
        tomatos.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size[0]), count: size[1])
    var days: [[Int]] = Array(repeating: Array(repeating: 0, count: size[0]), count: size[1])
    var needVisit: Queue<[Int]> = Queue()
    for x in 0...size[1]-1 {
        for y in 0...size[0]-1 {
            if tomatos[x][y] == 1 {
                days[x][y] = 1
                needVisit.enqueue([x, y])
            } else if tomatos[x][y] == -1 {
                days[x][y] = -1
            }
        }
    }
    while needVisit.isEmpty == false {
        let point = needVisit.dequeue()!,
            x = point[0],
            y = point[1]
        if visited[x][y] {
            continue
        }
        visited[x][y] = true
        if visited[x][safe: y-1] == false,
           tomatos[x][y-1] != -1 {
            needVisit.enqueue([x, y-1])
            if days[x][y-1] == 0 {
                days[x][y-1] = days[x][y] + 1
            }
        }
        if visited[x][safe: y+1] == false,
           tomatos[x][y+1] != -1 {
            needVisit.enqueue([x, y+1])
            if days[x][y+1] == 0 {
                days[x][y+1] = days[x][y] + 1
            }
        }
        if visited[safe: x-1]?[y] == false,
           tomatos[x-1][y] != -1 {
            needVisit.enqueue([x-1, y])
            if days[x-1][y] == 0 {
                days[x-1][y] = days[x][y] + 1
            }
        }
        if visited[safe: x+1]?[y] == false,
           tomatos[x+1][y] != -1 {
            needVisit.enqueue([x+1, y])
            if days[x+1][y] == 0 {
                days[x+1][y] = days[x][y] + 1
            }
        }
    }
    let dayList: [Int] = days.flatMap({ $0 }).sorted()
    guard dayList.contains(0) == false else {
        print(-1)
        return
    }
    print(dayList.last! - 1)
}

solution()
