var numbers = Set<Int>()

stride(from: 1, through: 10, by: 1).forEach { _ in
    numbers.insert(Int(readLine()!)! % 42)
}
print(numbers.count)
