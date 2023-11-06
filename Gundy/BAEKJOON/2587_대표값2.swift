func solution() {
    var numbers: [Int] = []
    for _ in 1...5 {
        let number: Int = Int(readLine()!)!
        numbers.append(number)
    }
    print(numbers.reduce(0, +) / 5)
    print(numbers.sorted()[2])
}

solution()
