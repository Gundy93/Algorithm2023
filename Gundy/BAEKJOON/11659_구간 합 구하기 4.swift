let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: input[0] + 1)

dp[0] = 0
dp[1] = numbers[0]

for index in stride(from: 1, to: input[0], by: 1) {
    dp[index + 1] = dp[index] + numbers[index]
}

var result = String()

for _ in 1...input[1] {
    let indices = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(dp[indices[1]] - dp[indices[0] - 1])\n"
}

print(result)
