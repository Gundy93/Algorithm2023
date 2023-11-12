var max = -1
var maxPoint = (0, 0)

for row in 1...9 {
    let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    for column in 0...8 {
        if numbers[column] > max {
            max = numbers[column]
            maxPoint = (row, column + 1)
        }
    }
}

print(max)
print(maxPoint.0, maxPoint.1)
