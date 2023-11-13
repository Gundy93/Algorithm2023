let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var target = input[2] - input[0]

print(1 + (target + input[0] - input[1] - 1) / (input[0] - input[1]))
