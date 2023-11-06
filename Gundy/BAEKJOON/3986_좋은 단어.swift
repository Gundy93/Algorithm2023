func solution() {
    let count: Int = Int(readLine()!)!
    var result: Int = 0
    for _ in 1...count {
        var text: String = readLine()!
        var stack: [Character] = []
        for character in text {
            if stack.last == character {
                stack.removeLast()
            } else {
                stack.append(character)
            }
        }
        if stack.isEmpty {
            result += 1
        }
    }
    print(result)
}

solution()
