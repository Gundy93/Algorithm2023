var result = String()
var number = 0

while let input = readLine(),
      input != "0 0 0" {
    let numbers = input.split(separator: " ").map { Int($0)! }
    let remainder = min(numbers[2] % numbers[1], numbers[0])
    
    number += 1
    result += "Case " + String(number) + ": " + String(numbers[2] / numbers[1] * numbers[0] + remainder) + "\n"
}

print(result)
