let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

print(numbers[input[1] - 1])
