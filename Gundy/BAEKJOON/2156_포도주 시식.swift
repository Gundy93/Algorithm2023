let count = Int(readLine()!)!
var wines = [Int]()

for _ in 1...count {
    wines.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: count)

dp[0] = wines[0]

if count > 1 {
    dp[1] = wines[0] + wines[1]
}

if count > 2 {
    dp[2] = max(wines[0] + wines[2], wines[1] + wines[2])
}

if count > 3 {
    dp[3] = max(dp[1] + wines[3], wines[0] + wines[2] + wines[3])
}

for index in stride(from: 4, to: count, by: 1) {
    dp[index] = max(dp[index - 2], max(dp[index - 4], dp[index - 3]) + wines[index - 1]) + wines[index]
}

print(count > 1 ? max(dp[count - 1], dp[count - 2]) : dp[0])
