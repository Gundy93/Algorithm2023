let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var left = 0
var right = 0
var partialSum = numbers[0]
var result = input[0] + 1

while left <= right,
      result > 1 {
    if partialSum >= input[1] {
        result = min(result, right - left + 1)
        partialSum -= numbers[left]
        left += 1
    } else {
        right += 1
        
        if right < input[0] {
            partialSum += numbers[right]
        } else {
            break
        }
    }
}

print(result == input[0] + 1 ? 0 : result)
