let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n + 1)

if n > 1 {
    for index in 2...n {
        dp[index] = dp[index - 1] + dp[index - 2] % 10007
    }
}

print(dp[n])
