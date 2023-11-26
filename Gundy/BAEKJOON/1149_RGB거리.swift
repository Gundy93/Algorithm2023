let count = Int(readLine()!)!
var buildings = [[Int]]()

for _ in 1...count {
    buildings.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: 0, count: 3), count: count)

dp[0] = buildings[0]

for index in stride(from: 1, to: count, by: 1) {
    dp[index][0] = min(dp[index - 1][1], dp[index - 1][2]) + buildings[index][0]
    dp[index][1] = min(dp[index - 1][0], dp[index - 1][2]) + buildings[index][1]
    dp[index][2] = min(dp[index - 1][0], dp[index - 1][1]) + buildings[index][2]
}

print(dp.last!.min()!)
