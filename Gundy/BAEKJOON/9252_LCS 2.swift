let first = ["0"] + Array(readLine()!)
let second = ["0"] + Array(readLine()!)
var dp = Array(repeating: Array(repeating: 0, count: second.count), count: first.count)


for row in 1..<first.count {
    for column in 1..<second.count {
        if second[column] == first[row] {
            dp[row][column] = dp[row - 1][column - 1] + 1
        } else {
            dp[row][column] = max(dp[row][column - 1], dp[row - 1][column])
        }
    }
}

func backtracking(row: Int, column: Int) -> String {
    if dp[row][column] == 0 {
        return ""
    } else if first[row] == second[column] {
        return backtracking(row: row - 1, column: column - 1) + String(first[row])
    } else if dp[row - 1][column] > dp[row][column - 1] {
        return backtracking(row: row - 1, column: column)
    } else {
        return backtracking(row: row, column: column - 1)
    }
}

var result = String(dp[first.count - 1][second.count - 1])

if dp[first.count - 1][second.count - 1] != 0 {
    result += "\n" + backtracking(row: first.count - 1, column: second.count - 1)
}

print(result)
