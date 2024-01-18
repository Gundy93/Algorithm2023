let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n + 1)

if n > 2 {
    for index in 3...n {
        dp[index] = dp[index - 1] + dp[index - 2]
    }
}

print(dp[n])
