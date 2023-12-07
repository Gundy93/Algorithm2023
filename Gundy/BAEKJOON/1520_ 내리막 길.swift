let size = readLine()!.split(separator: " ").map { Int($0)! }
var board = [[Int]]()

for _ in 1...size[0] {
    board.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])

func dfs(_ row: Int, _ column: Int) -> Int {
    guard (row == size[0] - 1 && column == size[1] - 1) == false else { return 1 }
    
    for (nextRow, nextColumn) in zip([-1, 1, 0, 0], [0, 0, -1, 1]) {
        let nextRow = row + nextRow
        let nextColumn = column + nextColumn
        
        guard nextRow >= 0, nextRow < size[0],
              nextColumn >= 0, nextColumn < size[1],
              board[row][column] > board[nextRow][nextColumn] else { continue }
        
        switch dp[nextRow][nextColumn] {
        case 0:
            dp[row][column] += dfs(nextRow, nextColumn)
        case 1...:
            dp[row][column] +=  dp[nextRow][nextColumn]
        default:
            break
        }
    }
    
    if dp[row][column] == 0 {
        dp[row][column] = -1
        
        return 0
    } else {
        return dp[row][column]
    }
}

print(dfs(0, 0))
