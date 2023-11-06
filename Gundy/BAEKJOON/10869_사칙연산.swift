func solution() {
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    print(numbers[0] + numbers[1])
    print(numbers[0] - numbers[1])
    print(numbers[0] * numbers[1])
    print(numbers[0] / numbers[1])
    print(numbers[0] % numbers[1])
}

solution()
