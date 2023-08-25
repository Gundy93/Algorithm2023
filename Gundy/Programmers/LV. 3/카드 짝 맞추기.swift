struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }
    var count: Int { return output.count + input.count }
    
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

func solution(_ board:[[Int]], _ r:Int, _ c:Int) -> Int {
    func getCount(_ board: [[Int]], _ from: (row: Int, column: Int), _ to: (row: Int, column: Int)) -> Int {
        var count = Int.max
        var visited = Array(repeating: Array(repeating: false, count: 4), count: 4)
        var needVisit = Queue([(from.row, from.column, 0)])
        while needVisit.isEmpty == false {
            let now = needVisit.dequeue()!
            guard now.0 >= 0, now.0 <= 3, now.1 >= 0, now.1 <= 3, visited[now.0][now.1] == false else { continue }
            guard [now.0, now.1] != [to.row, to.column] else {
                count = now.2
                break
            }
            visited[now.0][now.1] = true
            needVisit.enqueue((now.0 + 1, now.1, now.2 + 1))
            needVisit.enqueue((now.0 - 1, now.1, now.2 + 1))
            needVisit.enqueue((now.0, now.1 + 1, now.2 + 1))
            needVisit.enqueue((now.0, now.1 - 1, now.2 + 1))
            var downIndex = now.0 + 1
            while downIndex < 3, board[downIndex][now.1] == 0 {
                downIndex += 1
            }
            needVisit.enqueue((downIndex, now.1, now.2 + 1))
            var upIndex = now.0 - 1
            while upIndex > 0, board[upIndex][now.1] == 0 {
                upIndex -= 1
            }
            needVisit.enqueue((upIndex, now.1, now.2 + 1))
            var rightIndex = now.1 + 1
            while rightIndex < 3, board[now.0][rightIndex] == 0 {
                rightIndex += 1
            }
            needVisit.enqueue((now.0, rightIndex, now.2 + 1))
            var leftIndex = now.1 - 1
            while leftIndex > 0, board[now.0][leftIndex] == 0 {
                leftIndex -= 1
            }
            needVisit.enqueue((now.0, leftIndex, now.2 + 1))
        }
        return count
    }
    var result = Int.max
    var cardsCount = 0
    var positions = [Int: [(Int, Int)]]()
    for row in 0...3 {
        for column in 0...3 {
            let number = board[row][column]
            if number != 0 {
                cardsCount += 1
                positions[number, default: []].append((row, column))
            }
        }
    }
    var needVisit: [(board: [[Int]], row: Int, column: Int, count: Int, cards: [Int: [(Int, Int)]])] = [(board, r, c, 0, positions)]
    while needVisit.isEmpty == false {
        let now = needVisit.removeLast()
        guard now.count < result else { continue }
        guard now.cards.isEmpty == false else {
            result = now.count
            continue
        }
        for number in now.cards.keys {
            var cards = now.cards
            var board = now.board
            let points = cards[number]!
            let firstWay = getCount(board, (now.row, now.column), points[0]) + getCount(board, points[0], points[1])
            let secondWay = getCount(board, (now.row, now.column), points[1]) + getCount(board, points[1], points[0])
            let count = min(firstWay, secondWay)
            cards[number] = nil
            for point in points {
                board[point.0][point.1] = 0
            }
            let next = count == firstWay ? points[1]: points[0]
            needVisit.append((board, next.0, next.1, now.count + count, cards))
        }
    }
    return result + cardsCount
}
