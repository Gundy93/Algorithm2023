let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [Int]()

for _ in 0..<input[0] {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

var left = 0
var right = 0
var result = Int.max

while right < input[0],
      left <= right {
    let number = abs(numbers[left] - numbers[right])
    
    switch number {
    case ..<input[1]:
        right += 1
    case input[1]:
        result = number
        right = input[0]
    default:
        result = min(result, number)
        left += 1
    }
}

print(result)
