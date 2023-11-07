let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let result = numbers[0] - numbers[1]

print(result > 0 ? ">" : result < 0 ? "<" : "==")
