struct Queue {

    private var left: [(Int, Int)] = []
    private var right: [(Int, Int)]
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }

    init(_ elements: [(Int, Int)]) {
        right = elements
    }

    mutating func enqueue(_ element: (number: Int, count: Int)) {
        guard element.number >= 0,
              element.number <= 100000 else { return }
        right.append(element)
    }

    mutating func dequeue() -> (number: Int, count: Int)? {
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
    let now = input[0]
    var target = input[1]
    var needVisit = Queue([(now, 0)])
    var visited: Set<Int> = []
    while needVisit.isEmpty == false {
        let now = needVisit.dequeue()!
        guard visited.contains(now.number) == false else { continue }
        visited.insert(now.number)
        if now.number == target {
            print(now.count)
            return
        }
        for next in [now.number + 1, now.number - 1, now.number * 2] {
            if visited.contains(next) == false {
                needVisit.enqueue((next, now.count + 1))
            }
        }
    }
}

solution()
