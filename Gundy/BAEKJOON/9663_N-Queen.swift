let count = Int(readLine()!)!
var result = 0

func recursion(_ row: Int, _ columns: [Bool], _ upwards: [Bool], _ downwards: [Bool]) {
    guard row < count else {
        result += 1
        
        return
    }
    
    for column in 0...count - 1 {
        guard columns[column],
              upwards[row + column],
              downwards[count - 1 - column + row] else { continue }
        
        var columns = columns
        var upwards = upwards
        var downwards = downwards
        
        columns[column] = false
        upwards[row + column] = false
        downwards[count - 1 - column + row] = false
        
        recursion(row + 1, columns, upwards, downwards)
    }
}

let columns = Array(repeating: true, count: count)
let upwards = Array(repeating: true, count: count * 2 - 1)
let downwards = Array(repeating: true, count: count * 2 - 1)

recursion(0, columns, upwards, downwards)

print(result)
