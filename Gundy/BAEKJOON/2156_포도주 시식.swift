let count = Int(readLine()!)!
var wines = Array(repeating: 0, count: 4)

for _ in 0..<count {
    wines.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: count + 4)

for index in 4..<count + 4 {
    dp[index] = max(dp[index - 2], max(dp[index - 3], dp[index - 4]) + wines[index - 1]) + wines[index]
}

print(dp.max()!)
