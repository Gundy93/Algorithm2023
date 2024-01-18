let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n + 1)

for index in stride(from: 2, through: n, by: 1) {
    dp[index] = (dp[index - 1] + dp[index - 2] * 2) % 10007
}

print(dp[n])
