let count = Int(readLine()!)!
let solutions = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var left = 0
var right = count - 1
var minimum = 2000000001
var result = String()

while left < right {
    let value = solutions[left] + solutions[right]
    let absoluteValue = abs(value)
    
    if absoluteValue < minimum {
        minimum = absoluteValue
        result = "\(solutions[left]) \(solutions[right])"
    }
    
    if value <= 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(result)
