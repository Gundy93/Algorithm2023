let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let x = (numbers[2] * numbers[4] - numbers[1] * numbers[5]) / (numbers[0] * numbers[4] - numbers[1] * numbers[3])
let y = numbers[1] == 0 ? (numbers[5] - numbers[3] * x) / numbers[4] : (numbers[2] - numbers[0] * x) / numbers[1]

print(x, y)
