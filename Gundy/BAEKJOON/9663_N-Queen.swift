let length = Int(readLine()!)!
var columns = Array(repeating: false, count: length)
var rightUp = Array(repeating: false, count: length * 2 - 1)
var rightDown = Array(repeating: false, count: length * 2 - 1)
var result = 0

func backtracking(row: Int) {
    guard row < length else {
        result += 1
        
        return
    }
    
    for column in 0...length - 1 {
        guard columns[column] == false,
              rightUp[row + column] == false,
              rightDown[length - 1 + row - column] == false else { continue }
        
        columns[column] = true
        rightUp[row + column] = true
        rightDown[length - 1 + row - column] = true
        backtracking(row: row + 1)
        rightDown[length - 1 + row - column] = false
        rightUp[row + column] = false
        columns[column] = false
    }
}

for column in stride(from: 0, to: length / 2, by: 1) {
    columns[column] = true
    rightUp[column] = true
    rightDown[length - 1 - column] = true
    backtracking(row: 1)
    rightDown[length - 1 - column] = false
    rightUp[column] = false
    columns[column] = false
}

result *= 2

if length % 2 == 1 {
    let column = length / 2
    columns[column] = true
    rightUp[column] = true
    rightDown[length - 1 - column] = true
    backtracking(row: 1)
    rightDown[length - 1 - column] = false
    rightUp[column] = false
    columns[column] = false
}

print(result)
