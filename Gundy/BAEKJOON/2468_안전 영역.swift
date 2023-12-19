let delta = zip([-1, 1, 0, 0], [0, 0, -1, 1])
let length = Int(readLine()!)!
var land = [[Int]]()

for _ in 1...length {
    land.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let heights = land.flatMap { $0 }.sorted()
let minimum = heights.first!
let maximum = heights.last!

func countSafeAreas(_ height: Int) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: length), count: length)
    var result = 0
    
    func dfs(_ row: Int, _ column: Int) {
        guard 0...length - 1 ~= row,
              0...length - 1 ~= column,
              visited[row][column] == false else { return }
        
        visited[row][column] = true
        
        guard land[row][column] > height else { return }
        
        for (deltaRow, deltaColumn) in delta {
            let nextRow = row + deltaRow
            let nextColumn = column + deltaColumn
            
            dfs(nextRow, nextColumn)
        }
    }
    
    for row in 0...length - 1 {
        for column in 0...length - 1 {
            guard visited[row][column] == false else { continue }
            
            if land[row][column] > height {
                result += 1
                dfs(row, column)
            }
        }
    }
    
    return result
}

var result = 1

for height in stride(from: minimum, to: maximum, by: 1) {
    result = max(result, countSafeAreas(height))
}

print(result)
