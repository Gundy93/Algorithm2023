let n = Int(readLine()!)!
var result = String(n < 0 && n % 2 == 0 ? -1 : n == 0 ? 0 : 1) + "\n"
var dp = [0, 1]

if n > 0 {
    while dp.count <= n {
        dp.append((dp[dp.count-2] + dp[dp.count-1]) % 1000000000)
    }
} else {
    let n = abs(n)
    
    while dp.count <= n {
        dp.append((dp[dp.count-2] - dp[dp.count-1]) % 1000000000)
    }
}

result += String(abs(dp[abs(n)]))
print(result)
