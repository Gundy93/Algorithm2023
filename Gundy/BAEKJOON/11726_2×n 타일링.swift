let n = Int(readLine()!)!
var dp = [1,2]

while dp.count < n {
    dp.append((dp[dp.count-1] + dp[dp.count-2]) % 10007)
}

print(dp[n-1])
