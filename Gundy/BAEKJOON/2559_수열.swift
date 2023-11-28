let input = readLine()!.split(separator: " ").map { Int($0)! }
let temperature = readLine()!.split(separator: " ").map { Int($0)! }
var prefixSum = Array(repeating: 0, count: input[0] + 1)

for index in stride(from: 0, to: input[0], by: 1) {
    prefixSum[index + 1] = prefixSum[index] + temperature[index]
}

var dp = Array(repeating: 0, count: input[0] + 1 - input[1])

for index in stride(from: 0, to: input[0] + 1 - input[1], by: 1) {
    dp[index] = prefixSum[index + input[1]] - prefixSum[index]
}

print(dp.max()!)
