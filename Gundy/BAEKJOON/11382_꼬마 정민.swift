let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }

print(numbers.reduce(0, +))
