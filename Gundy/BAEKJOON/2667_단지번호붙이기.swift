let length = Int(readLine()!)!
let delta = zip([-1, 1, 0, 0], [0, 0, -1, 1])
var city = [[Character]]()

for _ in 1...length {
    city.append(Array(readLine()!))
}

var result = [Int]()

func dfs(_ row: Int, _ column: Int) -> Int {
    guard 0...length - 1 ~= row,
          0...length - 1 ~= column,
          city[row][column] == "1" else { return 0 }
    
    city[row][column] = "0"
    
    var result = 1
    
    for (deltaRow, deltaColumn) in delta {
        let nextRow = row + deltaRow
        let nextColumn = column + deltaColumn
        
        result += dfs(nextRow, nextColumn)
    }
    
    return result
}

for row in 0...length - 1 {
    for column in 0...length - 1 {
        if city[row][column] == "1" {
            result.append(dfs(row, column))
        }
    }
}

print("\(result.count)\n\(result.sorted().map(String.init).joined(separator: "\n"))")
