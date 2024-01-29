let input = readLine()!.split(separator: " ").map { Int($0)! }
var isFirst = [true]

for _ in 0..<input[0] {
    isFirst.append(readLine() == "1")
}

var dp = Array(repeating: Array(repeating: 0, count: input[0] + 1), count: input[1] + 2)

for index in 1...input[0] {
    for count in 1...input[1] + 1 {
        if isFirst[index] == (count % 2 == 1) {
            dp[count][index] = max(dp[count - 1][index - 1], dp[count][index - 1]) + 1
        } else {
            dp[count][index] = max(dp[count - 1][index - 1], dp[count][index - 1])
        }
    }
}

print(dp.map { $0.last! }.max()!)
