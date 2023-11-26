let count = Int(readLine()!)!
var steps = [Int]()

for _ in 1...count {
    steps.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: count)

dp[0] = steps[0]

if count > 1 {
    dp[1] = dp[0] + steps[1]
}

if count > 2 {
    dp[2] = max(dp[0] + steps[2], steps[1] + steps[2])
}

for index in stride(from: 3, to: count, by: 1) {
    dp[index] = max(dp[index - 2] + steps[index], dp[index - 3] + steps[index - 1] + steps[index])
}

print(dp.last!)
