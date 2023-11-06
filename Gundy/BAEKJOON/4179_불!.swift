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
    let width: Int = size[1]
    let height: Int = size[0]
    var maze: [[Int]] = Array(repeating: Array(repeating: 0, count: width), count: height)
    var distanceForPerson: [[Int]] = maze
    var distanceForFire: [[Int]] = maze
    var needVisitForPerson: Queue<[Int]> = Queue()
    var needVisitForFire: Queue<[Int]> = Queue()
    for y in 0..<height {
        let row: [Character] = readLine()!.map({ $0 })
        for x in 0..<width {
            switch row[x] {
            case "#":
                maze[y][x] = -1
            case "J":
                needVisitForPerson.enqueue([x, y])
                distanceForPerson[y][x] = 1
            case "F":
                maze[y][x] = -1
                needVisitForFire.enqueue([x, y])
                distanceForFire[y][x] = 1
            default:
                continue
            }
        }
    }
    let axisX: [Int] = [0, 0, -1, 1]
    let axisY: [Int] = [-1, 1, 0, 0]
    while needVisitForFire.isEmpty == false {
        let now: [Int] = needVisitForFire.dequeue()!
        let x: Int = now[0]
        let y: Int = now[1]
        for (dx, dy) in zip(axisX, axisY) {
            if maze[safe: y + dy]?[safe: x + dx] == 0,
               distanceForFire[y + dy][x + dx] == 0 {
                distanceForFire[y + dy][x + dx] = distanceForFire[y][x] + 1
                needVisitForFire.enqueue([x + dx, y + dy])
            }
        }
    }
    while needVisitForPerson.isEmpty == false {
        let now: [Int] = needVisitForPerson.dequeue()!
        let x: Int = now[0]
        let y: Int = now[1]
        if x == 0 || x == width - 1 ||
            y == 0 || y == height - 1 {
            print(distanceForPerson[y][x])
            return
        }
        for (dx, dy) in zip(axisX, axisY) {
            if maze[safe: y + dy]?[safe: x + dx] == 0,
               distanceForPerson[y + dy][x + dx] == 0,
               (distanceForPerson[y][x] + 1 < distanceForFire[y + dy][x + dx] ||
                distanceForFire[y + dy][x + dx] == 0) {
                distanceForPerson[y + dy][x + dx] = distanceForPerson[y][x] + 1
                needVisitForPerson.enqueue([x + dx, y + dy])
            }
        }
    }
    print("IMPOSSIBLE")
}

solution()
