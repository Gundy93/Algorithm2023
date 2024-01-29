var dp = [0]

dp.append(1)
dp.append(2)
dp.append(4)

let count = Int(readLine()!)!
var result = ""

for _ in 0..<count {
    let target = Int(readLine()!)!
    
    while dp.count <= target {
        dp.append(dp[dp.count - 1] + dp[dp.count - 2] + dp[dp.count - 3])
    }
    
    result += String(dp[target]) + "\n"
}

print(result)
