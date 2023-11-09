var numbers = [(Int, Int)]()

stride(from: 1, through: 9, by: 1).forEach { index in
    numbers.append((Int(readLine()!)!, index))
}
numbers.sort { $0.0 < $1.0 }
print(numbers[8].0)
print(numbers[8].1)
