let length = Int(readLine()!)!
var screen = [[String]]()

for _ in 1...length {
    screen.append(readLine()!.map(String.init))
}

func quadTree(_ row: Int, _ column: Int, _ length: Int) -> String {
    guard length > 1 else { return screen[row][column] }
    
    let first = quadTree(row, column, length / 2)
    var isWhole = first.count == 1
    var result = first
    
    for (row, column) in zip([row, row + length / 2, row + length / 2],
                             [column + length / 2, column, column + length / 2]) {
        let next = quadTree(row, column, length / 2)
        
        if isWhole {
            isWhole = first == next
        }
        
        result += next
    }
    
    return isWhole ? first : "(\(result))"
}

print(quadTree(0, 0, length))
