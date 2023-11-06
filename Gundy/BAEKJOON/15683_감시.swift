enum Side {
    case up
    case down
    case left
    case right
}

func watch(from point: (row: Int, column: Int), side: Side, board: inout [[Int]])  {
    switch side {
    case .up:
        for row in stride(from: point.row - 1, through: 0, by: -1) {
            guard board[row][point.column] != 6 else { return }
            board[row][point.column] = -1
        }
    case .down:
        for row in stride(from: point.row + 1, to: size[0], by: 1) {
            guard board[row][point.column] != 6 else { return }
            board[row][point.column] = -1
        }
    case .left:
        for column in stride(from: point.column - 1, through: 0, by: -1) {
            guard board[point.row][column] != 6 else { return }
            board[point.row][column] = -1
        }
    case .right:
        for column in stride(from: point.column + 1, to: size[1], by: 1) {
            guard board[point.row][column] != 6 else { return }
            board[point.row][column] = -1
        }
    }
}

func recursion(current index: Int, board: [[Int]]) {
    guard index < needVisit.count else {
        var count = 0
        for row in 0..<size[0] {
            for column in 0..<size[1] {
                if board[row][column] == 0 {
                    count += 1
                }
            }
        }
        result.append(count)
        return
    }
    let point = needVisit[index]
    switch point.value {
    case 1:
        for side in [Side.up, .down, .left, .right] {
            var board = board
            watch(from: (point.row, point.column), side: side, board: &board)
            recursion(current: index + 1, board: board)
        }
    case 2:
        for side in [(Side.up, Side.down), (Side.left, Side.right)] {
            var board = board
            watch(from: (point.row, point.column), side: side.0, board: &board)
            watch(from: (point.row, point.column), side: side.1, board: &board)
            recursion(current: index + 1, board: board)
        }
    case 3:
        for side in [(Side.up, Side.right), (Side.right, Side.down), (Side.down, Side.left), (Side.left, Side.up)] {
            var board = board
            watch(from: (point.row, point.column), side: side.0, board: &board)
            watch(from: (point.row, point.column), side: side.1, board: &board)
            recursion(current: index + 1, board: board)
        }
    case 4:
        for sides in [[Side.up, .right, .down], [Side.right, .down, .left], [Side.down, .left, .up], [Side.left, .up, .right]] {
            var board = board
            for side in sides {
                watch(from: (point.row, point.column), side: side, board: &board)
            }
            recursion(current: index + 1, board: board)
        }
    default:
        var board = board
        for side in [Side.up, .down, .left, .right] {
            watch(from: (point.row, point.column), side: side, board: &board)
        }
        recursion(current: index + 1, board: board)
    }
}

let size = readLine()!.split(separator: " ").compactMap({ Int($0) })
var board = [[Int]]()
for _ in 1...size[0] {
    board.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
}

var needVisit = [(row: Int, column: Int, value: Int)]()
for row in 0..<size[0] {
    for column in 0..<size[1] {
        if 1...5 ~= board[row][column] {
            needVisit.append((row, column, board[row][column]))
        }
    }
}

var result = [Int]()

recursion(current: 0, board: board)

print(result.sorted().first!)
