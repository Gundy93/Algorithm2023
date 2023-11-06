let numbers = readLine()!.split(separator: " ").compactMap { Double(String($0)) }

print(numbers[0] / numbers[1])
