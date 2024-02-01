let count = Int(readLine()!)!
var dp = [0,1,2,4]
var result = ""

for _ in 0..<count {
    let target = Int(readLine()!)!
    
    while dp.count <= target {
        dp.append((dp[dp.count - 1] + dp[dp.count - 2] + dp[dp.count - 3]) % 1000000009)
    }
    
    result += String(dp[target]) + "\n"
}

print(result)
