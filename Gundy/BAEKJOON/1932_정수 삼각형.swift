let height = Int(readLine()!)!
var pyramid = [[Int]]()

(0..<height)
    .forEach { _ in
        pyramid.append(readLine()!.split(separator: " ").map { Int($0)! })
    }

var dp = Array(repeating: Array(repeating: 0, count: height + 1), count: height + 1)

for row in 0..<height {
    for column in 1...pyramid[row].count {
        dp[row + 1][column] = max(dp[row][column - 1], dp[row][column]) + pyramid[row][column - 1]
    }
}

print(dp[height].max()!)
