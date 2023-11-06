let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

print(numbers[0] * numbers[1])
