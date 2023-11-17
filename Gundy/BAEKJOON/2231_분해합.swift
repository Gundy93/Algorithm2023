let input = readLine()!
let target = Int(input)!
var result = 0

for number in stride(from: target - 1, through: target - 9 * input.count, by: -1) {
    let numbers = String(number).compactMap { Int(String($0)) }
    
    if numbers.reduce(0, +) + number == target {
        result = number
    }
}

print(result)
