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
    let heightOfBuilding = input[0]
    let now = input[1]
    let target = input[2]
    let up = input[3]
    let down = input[4]
    var needVisit = Queue<(floor: Int, count: Int)>([(now, 0)])
    var visited = Set<Int>()
    while needVisit.isEmpty == false {
        let floor = needVisit.dequeue()!
        if floor.0 == target {
            print(floor.1)
            return
        }
        guard floor.0 > 0,
              floor.0 <= heightOfBuilding,
              visited.contains(floor.0) == false else { continue }
        visited.insert(floor.0)
        needVisit.enqueue((floor.0 + up, floor.1 + 1))
        needVisit.enqueue((floor.0 - down, floor.1 + 1))
    }
    print("use the stairs")
}

solution()
