let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [Int]()

for _ in 0..<input[0] {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

var result = Int.max
var start = 0
var end = 0

while start <= end,
      end < input[0] {
    let difference = numbers[end] - numbers[start]
    
    if difference >= input[1] {
        result = min(result, difference)
        start += 1
    } else {
        end += 1
    }
}

print(result)
