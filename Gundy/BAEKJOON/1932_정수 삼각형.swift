let count = Int(readLine()!)!
var floors = [[Int]]()

for _ in 1...count {
    floors.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(1...count).map { Array(repeating: 0, count: $0) }

dp[0] = floors[0]

for row in stride(from: 1, to: count, by: 1) {
    dp[row][0] = dp[row - 1][0] + floors[row][0]
    
    for column in stride(from: 1, to: dp[row].count - 1, by: 1) {
        dp[row][column] = max(dp[row - 1][column - 1], dp[row - 1][column]) + floors[row][column]
    }
    
    dp[row][dp[row].count - 1] = dp[row - 1][dp[row].count - 2] + floors[row][dp[row].count - 1]
}

print(dp.last!.max()!)
