let count = Int(readLine()!)!
var dp = [(1,0), (0,1)]
var result = ""

for _ in 0..<count {
    let target = Int(readLine()!)!
    
    while dp.count <= target {
        dp.append((dp[dp.count - 2].0 + dp[dp.count - 1].0, dp[dp.count - 2].1 + dp[dp.count - 1].1))
    }
    
    result += String(dp[target].0) + " " + String(dp[target].1) + "\n"
}

print(result)
