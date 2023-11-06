let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var dp = Array(repeating: Array(repeating: 1, count: numbers[0] + 1), count: numbers[0] + 1)

if numbers[0] > 1 {
    for n in 2...numbers[0] {
        for k in 1..<n {
            dp[n][k] = (dp[n-1][k] + dp[n-1][k-1]) % 10007
        }
    }
}

print(dp[numbers[0]][numbers[1]])
