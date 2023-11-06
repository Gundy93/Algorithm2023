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
    var maze: [[Int]] = []
    for _ in 1...size[0] {
        maze.append(readLine()!.compactMap({ Int(String($0)) }))
    }
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
    var distance: [[Int]] = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
    var needVisit: Queue<[Int]> = Queue()
    distance[0][0] = 1
    for x in 0...size[0]-1 {
        for y in 0...size[1]-1 {
            if visited[x][y] {
                continue
            }
            needVisit.enqueue([x, y])
            while needVisit.isEmpty == false {
                let point = needVisit.dequeue()!,
                    x = point[0],
                    y = point[1]
                if visited[x][y] {
                    continue
                }
                visited[x][y] = true
                guard maze[x][y] == 1 else {
                    continue
                }
                if visited[x][safe: y-1] == false {
                    needVisit.enqueue([x, y-1])
                    if distance[x][y-1] == 0 {
                        distance[x][y-1] = distance[x][y] + 1
                    }
                }
                if visited[x][safe: y+1] == false {
                    needVisit.enqueue([x, y+1])
                    if distance[x][y+1] == 0 {
                        distance[x][y+1] = distance[x][y] + 1
                    }
                }
                if visited[safe: x-1]?[y] == false {
                    needVisit.enqueue([x-1, y])
                    if distance[x-1][y] == 0 {
                        distance[x-1][y] = distance[x][y] + 1
                    }
                }
                if visited[safe: x+1]?[y] == false {
                    needVisit.enqueue([x+1, y])
                    if distance[x+1][y] == 0 {
                        distance[x+1][y] = distance[x][y] + 1
                    }
                }
            }
        }
    }
    print(distance[size[0]-1][size[1]-1])
}

solution()
