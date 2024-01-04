let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let target = Int(readLine()!)!
var left = 0
var right = count - 1
var result = 0

while left < right {
    let number = numbers[left] + numbers[right]
    
    if number == target {
        result += 1
    }
    
    if number <= target {
        left += 1
    } else {
        right -= 1
    }
}

print(result)
