let input = readLine()!.split(separator: " ").map { Int($0)! }
var board = [Array(repeating: 0, count: input[0] + 1)]

for _ in 1...input[0] {
    var prefixSum = readLine()!.split(separator: " ").map { Int($0)! }
    
    for index in stride(from: 1, to: input[0], by: 1) {
        prefixSum[index] += prefixSum[index - 1]
    }
    
    board.append([0] + prefixSum)
}

for column in stride(from: 1, through: input[0], by: 1) {
    for row in stride(from: 2, through: input[0], by: 1) {
        board[row][column] += board[row - 1][column]
    }
}

var result = String()

for _ in 1...input[1] {
    let points = readLine()!.split(separator: " ").map { Int($0)! }
    var sum = board[points[2]][points[3]] + board[points[0] - 1][points[1] - 1]
    
    sum -= board[points[0] - 1][points[3]] + board[points[2]][points[1] - 1]
    result += "\(sum)\n"
}

print(result)
