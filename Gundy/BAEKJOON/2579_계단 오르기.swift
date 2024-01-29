let count = Int(readLine()!)!
var values = [0,0,0]

for _ in 0..<count {
    values.append(Int(readLine()!)!)
}

var dp = Array(repeating: 0, count: count + 3)

for index in 3..<count + 3 {
    dp[index] = max(dp[index - 3] + values[index - 1], dp[index - 2]) + values[index]
}

print(dp.last!)
