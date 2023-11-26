let count = Int(readLine()!)!
var dp = Array(repeating: 1, count: count + 1)

if count > 1 {
    dp[2] = 2
    
    for number in stride(from: 3, through: count, by: 1) {
        dp[number] = (dp[number - 2] + dp[number - 1]) % 15746
    }
}

print(dp[count])
