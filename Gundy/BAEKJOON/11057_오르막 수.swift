let target = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 1, count: 10), count: target + 1)

for index in 2..<target+1 {
    for last in 0...9 {
        dp[index][last] = (last..<10).map { dp[index-1][$0] }.reduce(0, +) % 10007
    }
}

print(dp[target].reduce(0, +) % 10007)
