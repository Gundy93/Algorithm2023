func solution(_ board: [[Int]]) -> Int {
    guard board.count > 1, board[0].count > 1 else {
        return board.flatMap { $0 }.contains(1) ? 1 : 0
    }
    var board = board
    var maxValue = 0
    for row in 1...board.count - 1 {
        for column in 1...board[0].count - 1 {
            guard board[row][column] == 1 else { continue }
            board[row][column] += min(board[row - 1][column - 1], board[row - 1][column], board[row][column - 1])
            if board[row][column] > maxValue {
                maxValue = board[row][column]
            }
        }
    }
    return maxValue * maxValue
}
