var numbers = [Int]()

for _ in 1...5 {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()
print(numbers.reduce(0, +) / 5)
print(numbers[2])
