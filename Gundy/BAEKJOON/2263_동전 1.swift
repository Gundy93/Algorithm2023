let input = readLine()!.split(separator: " ").map { Int($0)! }
let maximum = Array(repeating: 2, count: 31).reduce(1, *)
var coins = [Int]()
var dp = Array(repeating: 0, count: input[1] + 1)

for _ in 1...input[0] {
    coins.append(Int(readLine()!)!)
}

dp[0] = 1

for coin in coins {
    for index in stride(from: coin, through: input[1], by: 1) {
        if dp[index] + dp[index - coin] >= maximum {
            dp[index] = 0
        } else {
            dp[index] += dp[index - coin]
        }
    }
}

print(dp[input[1]])
