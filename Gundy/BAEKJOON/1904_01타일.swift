let n = Int(readLine()!)!
var dp = [1, 1]

while dp.count <= n {
    dp.append((dp[dp.count-2] + dp[dp.count-1]) % 15746)
}

print(dp[n])
