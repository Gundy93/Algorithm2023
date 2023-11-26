let count = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: count)

for index in 0...9 {
    dp[0][index] = 1
}

for row in stride(from: 1, to: count, by: 1) {
    dp[row][0] = dp[row - 1][1]
    
    for index in 1...8 {
        dp[row][index] = (dp[row - 1][index - 1] + dp[row - 1][index + 1]) % 1000000000
    }
    
    dp[row][9] = dp[row - 1][8]
}

print(dp.last![1...9].reduce(0, +) % 1000000000)
