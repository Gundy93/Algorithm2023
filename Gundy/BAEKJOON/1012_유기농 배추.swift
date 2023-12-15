let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    result += "\(solution())\n"
}

print(result)

func solution() -> Int {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var board = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
    
    for _ in 1...input[2] {
        let point = readLine()!.split(separator: " ").map { Int($0)! }
        
        board[point[0]][point[1]] = true
    }
    
    var visited = Array(repeating: Array(repeating: false, count: input[1]), count: input[0])
    
    func dfs(_ row: Int, _ column: Int) {
        guard visited[row][column] == false else { return }
        
        visited[row][column] = true
        
        guard board[row][column] else { return }
        
        for (nextRow, nextColumn) in zip([-1, 1, 0, 0], [0, 0, -1, 1]) {
            let row = row + nextRow
            let column = column + nextColumn
            
            guard row >= 0, row < input[0],
                  column >= 0, column < input[1],
                  visited[row][column] == false else { continue }
            
            dfs(row, column)
        }
    }
    
    var count = 0
    
    for row in 0...input[0] - 1 {
        for column in 0...input[1] - 1 {
            if board[row][column],
               visited[row][column] == false {
                count += 1
                dfs(row, column)
            }
        }
    }
    
    return count
}
