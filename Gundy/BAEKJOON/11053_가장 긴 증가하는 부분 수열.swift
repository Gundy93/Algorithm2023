let count = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: count)

for index in stride(from: 1, to: count, by: 1) {
    stride(from: 0, to: index, by: 1).filter { numbers[$0] < numbers[index] }.forEach { dp[index] = max(dp[index], dp[$0] + 1) }
}

print(dp.max()!)
