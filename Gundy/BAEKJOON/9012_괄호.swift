func solution() {
    let count: Int = Int(readLine()!)!
    for _ in 1...count {
        let text: String = readLine()!
        var stack: [Character] = []
        for character in text {
            switch character {
            case "(":
                stack.append(character)
            default:
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    stack.append(character)
                    break
                }
            }
        }
        if stack.isEmpty {
            print("YES")
        } else {
            print("NO")
        }
    }
}

solution()
