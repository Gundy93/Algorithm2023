let _ = readLine()
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

print(numbers.min()!, numbers.max()!)
