let target = Int(readLine()!)!
var dp = Array(repeating: Int.max, count: target + 1)

dp[1] = 0

for number in 2..<target + 1 {
    if number % 6 == 0 {
        dp[number] = min(dp[number - 1], min(dp[number / 2], dp[number / 3])) + 1
    } else if number % 3 == 0 {
        dp[number] = min(dp[number - 1], dp[number / 3]) + 1
    } else if number % 2 == 0 {
        dp[number] = min(dp[number - 1], dp[number / 2]) + 1
    } else {
        dp[number] = dp[number - 1] + 1
    }
}

print(dp[target])
