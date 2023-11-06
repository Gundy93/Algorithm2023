func solution() {
    var numbers: [Int] = []
    for _ in 1...7 {
        let number: Int = Int(readLine()!)!
        if number % 2 == 1 {
            numbers.append(number)
        }
    }
    if numbers.isEmpty {
        print(-1)
    } else {
        print(numbers.reduce(0, +))
        print(numbers.sorted()[0])
    }
}

solution()
