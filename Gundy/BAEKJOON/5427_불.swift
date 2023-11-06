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
    var distanceForPerson: [[Int]] = Array(repeating: Array(repeating: 0, count: size[0]), count: size[1])
    var distanceForFire: [[Int]] = distanceForPerson
    var target: [[Int]] = []
    var distance: Int = 0
    var building: [[Int]] = distanceForPerson
    for y in 0..<size[1] {
        let row: [Character] = readLine()!.map({ $0 })
        for x in 0..<size[0] {
            switch row[x] {
            case "#":
                building[y][x] = -1
            case "@":
                building[y][x] = -2
            case "*":
                building[y][x] = -3
            default:
                continue
            }
        }
    }
    var needVisitForPerson: Queue<[Int]> = Queue()
    var needVisitForFire: Queue<[Int]> = Queue()
    for y in 0..<size[1] {
        for x in 0..<size[0] {
            if building[y][x] == -2 {
                needVisitForPerson.enqueue([x, y])
                distanceForPerson[y][x] = 1
            }
            if building[y][x] == -3 {
                needVisitForFire.enqueue([x, y])
                distanceForFire[y][x] = 1
            }
        }
    }
    let axisX: [Int] = [0, 0, -1, 1]
    let axisY: [Int] = [-1, 1, 0, 0]
    while needVisitForPerson.isEmpty == false {
        let now: [Int] = needVisitForPerson.dequeue()!
        let x: Int = now[0]
        let y: Int = now[1]
        if distance != 0 {
            guard distanceForPerson[y][x] <= distance else { continue }
        }
        if x == 0 || x == size[0] - 1 || y == 0 || y == size[1] - 1 {
            target.append([x, y])
            if distance == 0 {
                distance = distanceForPerson[y][x]
            }
        }
        for (dx, dy) in zip(axisX, axisY) {
            if building[safe: y + dy]?[safe: x + dx] == 0,
               distanceForPerson[safe: y + dy]?[safe: x + dx] == 0 {
                distanceForPerson[y + dy][x + dx] = distanceForPerson[y][x] + 1
                needVisitForPerson.enqueue([x + dx, y + dy])
            }
        }
    }
    if target.isEmpty {
        print("IMPOSSIBLE")
        return
    }
    var count: Int = 0
    while needVisitForFire.isEmpty == false {
        let now: [Int] = needVisitForFire.dequeue()!
        let x: Int = now[0]
        let y: Int = now[1]
        guard distanceForFire[y][x] <= distance else { continue }
        if target.contains([x, y]),
            distanceForFire[y][x] <= distanceForPerson[y][x] {
            count += 1
        }
        for (dx, dy) in zip(axisX, axisY) {
            if (building[safe: y + dy]?[safe: x + dx] == 0 ||
                building[safe: y + dy]?[safe: x + dx] == -2),
               distanceForFire[safe: y + dy]?[safe: x + dx] == 0 {
                distanceForFire[y + dy][x + dx] = distanceForFire[y][x] + 1
                needVisitForFire.enqueue([x + dx, y + dy])
            }
        }
    }
    guard count < target.count else {
        print("IMPOSSIBLE")
        return
    }
    print(distance)
}

let count: Int = Int(readLine()!)!

for _ in 1...count {
    solution()
}
