let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: count)

dp[0] = numbers[0]

for index in stride(from: 1, to: count, by: 1) {
    dp[index] = max(dp[index - 1] + numbers[index], numbers[index])
}

print(dp.max()!)
