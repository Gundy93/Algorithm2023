struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }
    
    init(_ elements: [T] = []) {
        input = elements
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

func solution(_ board:[[Int]]) -> Int {
    let target = [board.count - 1, board.count - 1]
    var result = Int.max
    var queue = Queue([([[0, 0], [0, 1]], 0)])
    var visited = Set<[[Int]]>()
    while queue.isEmpty == false {
        let now = queue.dequeue()!
        guard visited.contains(now.0) == false, now.0.flatMap({ $0 }).allSatisfy({ $0 >= 0 && $0 < board.count }), now.0.allSatisfy({ board[$0[0]][$0[1]] == 0 }) else { continue }
        guard now.0.contains(target) == false else {
            result = now.1
            break
        }
        visited.insert(now.0)
        queue.enqueue(([[now.0[0][0] + 1, now.0[0][1]], [now.0[1][0] + 1, now.0[1][1]]], now.1 + 1))
        queue.enqueue(([[now.0[0][0] - 1, now.0[0][1]], [now.0[1][0] - 1, now.0[1][1]]], now.1 + 1))
        queue.enqueue(([[now.0[0][0], now.0[0][1] + 1], [now.0[1][0], now.0[1][1] + 1]], now.1 + 1))
        queue.enqueue(([[now.0[0][0], now.0[0][1] - 1], [now.0[1][0], now.0[1][1] - 1]], now.1 + 1))
        if abs(now.0[0][0] - now.0[1][0]) == 1 {
            if now.0[0][1] - 1 >= 0, board[now.0[0][0]][now.0[0][1] - 1] == 0, now.0[1][1] - 1 >= 0, board[now.0[1][0]][now.0[1][1] - 1] == 0 {
                queue.enqueue(([[now.0[0][0], now.0[0][1] - 1], [now.0[0][0], now.0[0][1]]], now.1 + 1))
                queue.enqueue(([[now.0[1][0], now.0[1][1] - 1], [now.0[1][0], now.0[1][1]]], now.1 + 1))
            }
            if now.0[0][1] + 1 < board.count, board[now.0[0][0]][now.0[0][1] + 1] == 0, now.0[1][1] + 1 < board.count, board[now.0[1][0]][now.0[1][1] + 1] == 0 {
                queue.enqueue(([[now.0[0][0], now.0[0][1] + 1], [now.0[0][0], now.0[0][1]]], now.1 + 1))
                queue.enqueue(([[now.0[1][0], now.0[1][1] + 1], [now.0[1][0], now.0[1][1]]], now.1 + 1))
            }
        } else {
            if now.0[0][0] - 1 >= 0, board[now.0[0][0] - 1][now.0[0][1]] == 0, now.0[1][0] - 1 >= 0, board[now.0[1][0] - 1][now.0[1][1]] == 0 {
                queue.enqueue(([[now.0[0][0], now.0[0][1]], [now.0[0][0] - 1, now.0[0][1]]], now.1 + 1))
                queue.enqueue(([[now.0[1][0], now.0[1][1]], [now.0[1][0] - 1, now.0[1][1]]], now.1 + 1))
            }
            if now.0[0][0] + 1 < board.count, board[now.0[0][0] + 1][now.0[0][1]] == 0, now.0[1][0] + 1 < board.count, board[now.0[1][0] + 1][now.0[1][1]] == 0 {
                queue.enqueue(([[now.0[0][0], now.0[0][1]], [now.0[0][0] + 1, now.0[0][1]]], now.1 + 1))
                queue.enqueue(([[now.0[1][0], now.0[1][1]], [now.0[1][0] + 1, now.0[1][1]]], now.1 + 1))
            }
        }
    }
    return result
}
