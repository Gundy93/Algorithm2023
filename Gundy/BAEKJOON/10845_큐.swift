struct Queue<T> {

    private var left: [T] = []
    private var right: [T]
    var count: Int {
        return left.count + right.count
    }
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    var first: T? {
        if left.isEmpty {
            return right.first
        }
        return left.last
    }
    var last: T? {
        if right.isEmpty {
            return left.first
        }
        return right.last
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
    let numberOfCommands = Int(readLine()!)!
    var queue: Queue<Int> = Queue()
    for _ in 1...numberOfCommands {
        let command = readLine()!
        switch command {
        case "front":
            print(queue.first ?? -1)
        case "back":
            print(queue.last ?? -1)
        case "size":
            print(queue.count)
        case "empty":
            print(queue.isEmpty ? 1 : 0)
        case "pop":
            print(queue.dequeue() ?? -1)
        default:
            let element = command.split(separator: " ").compactMap({ Int($0) })[0]
            queue.enqueue(element)
        }
    }
}

solution()
