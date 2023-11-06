func solution() {
    let input: Int = readLine()!.split(separator: " ").compactMap({ Int(String($0)) })[1]
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int(String($0)) })
    var result: [String] = []
    for number in numbers {
        if number < input {
            result.append(number.description)
        }
    }
    print(result.joined(separator: " "))
}

solution()
