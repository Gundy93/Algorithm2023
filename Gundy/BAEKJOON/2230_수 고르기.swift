var result = 2000000000
let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var numbers = [Int]()

for _ in 1...input[0] {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

var left = 0
var right = 0

while right < numbers.count,
      left < numbers.count {
    let difference = numbers[right] - numbers[left]
    if difference >= input[1] {
        if difference < result {
            result = difference
        }
        left += 1
    } else {
        right += 1
    }
}

print(result)
