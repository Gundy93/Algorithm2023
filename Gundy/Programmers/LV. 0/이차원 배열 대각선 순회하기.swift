func solution(_ board:[[Int]], _ k:Int) -> Int {
    var result = 0
    for row in 0...board.count - 1 {
        for column in 0...board[row].count - 1 {
            guard row + column <= k else { break }
            result += board[row][column]
        }
    }
    return result
}
