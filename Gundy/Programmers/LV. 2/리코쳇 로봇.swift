struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }
    
    init(_ elements: [T]) {
        input = elements
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            guard input.isEmpty == false else { return nil }
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func solution(_ board:[String]) -> Int {
    let board = board.map { $0.map(String.init) }
    var visited = Array(repeating: Array(repeating: false, count: board[0].count), count: board.count)
    var needVisit = Queue([[Int]]())
    var result = Int.max
    var isGoal = false
    for row in 0...board.count - 1 {
        for column in 0...board[0].count - 1 {
            if board[row][column] == "R" {
                needVisit.enqueue([row, column, 0])
                break
            }
        }
    }
    while needVisit.isEmpty == false {
        let now = needVisit.dequeue()!
        guard board[now[0]][now[1]] != "G" else {
            if result > now[2] {
                result = now[2]
            }
            if isGoal == false {
                isGoal = true
            }
            break
        }
        guard visited[now[0]][now[1]] == false else { continue }
        visited[now[0]][now[1]] = true
        var left = now[1]
        while left >= 0, board[now[0]][left] != "D" {
            left -= 1
        }
        if left != now[1] {
            left += 1
            needVisit.enqueue([now[0], left, now[2] + 1])
        }
        var right = now[1]
        while right < board[0].count, board[now[0]][right] != "D" {
            right += 1
        }
        if right != now[1] {
            right -= 1
            needVisit.enqueue([now[0], right, now[2] + 1])
        }
        var up = now[0]
        while up >= 0, board[up][now[1]] != "D" {
            up -= 1
        }
        if up != now[0] {
            up += 1
            needVisit.enqueue([up, now[1], now[2] + 1])
        }
        var down = now[0]
        while down < board.count, board[down][now[1]] != "D" {
            down += 1
        }
        if down != now[0] {
            down -= 1
            needVisit.enqueue([down, now[1], now[2] + 1])
        }
    }
    return isGoal ? result : -1
}
