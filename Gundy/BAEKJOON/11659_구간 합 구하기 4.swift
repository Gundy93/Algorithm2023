let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: input[0] + 1)

for index in stride(from: 0, to: input[0], by: 1) {
    dp[index + 1] = dp[index] + numbers[index]
}

var result = String()

for _ in 1...input[1] {
    let indices = readLine()!.split(separator: " ").map { Int($0)! }
    result += "\(dp[indices[1]] - dp[indices[0] - 1])\n"
}

print(result)
