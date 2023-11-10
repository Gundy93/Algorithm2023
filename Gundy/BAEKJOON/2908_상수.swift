let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0.reversed())) }

print(numbers.max()!)
