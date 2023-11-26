let count = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Array(repeating: 1, count: 2), count: count)

for index in stride(from: 1, to: count, by: 1) {
    stride(from: 0, to: index, by: 1).forEach({
        if numbers[$0] < numbers[index] {
            dp[index][0] = max(dp[index][0], dp[$0][0] + 1)
        } else if numbers[$0] > numbers[index] {
            dp[index][1] = max(dp[index][1], max(dp[$0][0], dp[$0][1]) + 1)
        }
    })
}

print(dp.compactMap({ $0.max() }).max()!)
