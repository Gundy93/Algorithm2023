let count = Int(readLine()!)!
var matrixes = [[Int]]()

for _ in 1...count {
    matrixes.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: Int.max / 3, count: count), count: count)

for index in 0...count - 1 {
    dp[index][index] = 0
}

for length in 1...count - 1 {
    for start in 0...count - 1 - length {
        for point in start...start + length - 1 {
            dp[start][start + length] = min(dp[start][start + length], dp[start][point] + dp[point + 1][start + length] + matrixes[start][0] * matrixes[point][1] * matrixes[start + length][1])
        }
    }
}

print(dp[0][count - 1])
