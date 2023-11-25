let count = Int(readLine()!)!
var columns = Array(repeating: true, count: count)
var upwards = Array(repeating: true, count: count * 2 - 1)
var downwards = Array(repeating: true, count: count * 2 - 1)
var result = 0

func backTracking(_ row: Int) {
    guard row < count else {
        result += 1
        
        return
    }
    
    for column in 0...count - 1 {
        guard columns[column],
              upwards[row + column],
              downwards[count - 1 - column + row] else { continue }
        
        columns[column] = false
        upwards[row + column] = false
        downwards[count - 1 - column + row] = false
        
        backTracking(row + 1)
        
        columns[column] = true
        upwards[row + column] = true
        downwards[count - 1 - column + row] = true
    }
}

backTracking(0)

print(result)
