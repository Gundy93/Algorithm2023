func solution() {
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
    print(numbers.map({ String($0) }).joined(separator: " "))
}

solution()
