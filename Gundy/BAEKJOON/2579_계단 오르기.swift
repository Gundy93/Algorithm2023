let count = Int(readLine()!)!
var steps = [Int]()

for _ in 1...count {
    steps.append(Int(readLine()!)!)
}

var dp = steps

if count > 1 {
    dp[1] += dp[0]
}

if count > 2 {
    dp[2] += max(dp[0], steps[1])
}

for index in stride(from: 3, to: count, by: 1) {
    dp[index] += max(dp[index - 2], dp[index - 3] + steps[index - 1])
}

print(dp.last!)
