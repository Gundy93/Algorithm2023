let countOfPapers = Int(readLine()!)!
var board = Array(repeating: Array(repeating: 0, count: 101), count: 101)

for _ in 1...countOfPapers {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    board[input[0]][input[1]] += 1
    board[input[0] + 10][input[1]] -= 1
    board[input[0]][input[1] + 10] -= 1
    board[input[0] + 10][input[1] + 10] += 1
}

for row in 1...100 {
    for column in 1...100 {
        board[row][column] += board[row][column - 1]
    }
}

for row in 1...100 {
    for column in 1...100 {
        board[row][column] += board[row - 1][column]
    }
}

var result = 0

for row in 1...100 {
    for column in 1...100 {
        if board[row][column] > 0 {
            result += 1
        }
    }
}

print(result)
