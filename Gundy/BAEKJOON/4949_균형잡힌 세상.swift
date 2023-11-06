func solution() {
    while true {
        let text: String = readLine()!
        if text == "." {
            break
        }
        var stack: [Character] = []
        for character in text {
            switch character {
            case "(":
                stack.append(character)
            case ")":
                if stack.last == "(" {
                    stack.removeLast()
                } else {
                    stack.append(character)
                    break
                }
            case "[":
                stack.append(character)
            case "]":
                if stack.last == "[" {
                    stack.removeLast()
                } else {
                    stack.append(character)
                    break
                }
            default:
                if character == "." {
                    break
                }
            }
        }
        if stack.isEmpty {
            print("yes")
        } else {
            print("no")
        }
    }
}

solution()
