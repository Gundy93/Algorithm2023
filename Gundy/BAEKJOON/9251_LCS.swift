let first = ["0"] + readLine()!.map(String.init)
let second = ["0"] + readLine()!.map(String.init)
var dp = Array(repeating: Array(repeating: 0, count: second.count), count: first.count)

for row in 1...first.count - 1 {
    for column in 1...second.count - 1 {
        if first[row] == second[column] {
            dp[row][column] = dp[row - 1][column - 1] + 1
        } else {
            dp[row][column] = max(dp[row - 1][column], dp[row][column - 1])
        }
    }
}

print(dp[first.count - 1][second.count - 1])
