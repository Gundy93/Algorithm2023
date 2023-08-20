func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    var totalSum = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    for command in skill {
        let value = command[0] == 1 ? -command[5] : command[5]
        totalSum[command[1]][command[2]] += value
        if command[4] < board[0].count - 1 {
            totalSum[command[1]][command[4] + 1] -= value
        }
        if command[3] < board.count - 1 {
            totalSum[command[3] + 1][command[2]] -= value
            if command[4] < board[0].count - 1 {
                totalSum[command[3] + 1][command[4] + 1] += value
            }
        }
    }
    for row in 0...board.count - 1 {
        for column in stride(from: 1, to: board[0].count, by: 1) {
            totalSum[row][column] += totalSum[row][column - 1]
        }
    }
    for row in stride(from: 1, to: board.count, by: 1) {
        for column in 0...board[0].count - 1 {
            totalSum[row][column] += totalSum[row - 1][column]
        }
    }
    var result = 0
    for row in 0...board.count - 1 {
        for column in 0...board[0].count - 1 {
            if board[row][column] + totalSum[row][column] > 0 {
                result += 1
            }
        }
    }
    return result
}
