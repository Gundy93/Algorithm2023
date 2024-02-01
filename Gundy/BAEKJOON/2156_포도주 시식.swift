let count = Int(readLine()!)!
var wines = [0,0,0]

for _ in 0..<count {
    wines.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: count + 3)

for index in 3..<count + 3 {
    dp[index] = max(dp[index - 2], dp[index - 3] + wines[index - 1]) + wines[index]
}

print(dp.max()!)
