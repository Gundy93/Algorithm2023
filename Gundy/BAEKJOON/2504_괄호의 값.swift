func solution() {
    let input: String = readLine()!
    var characterStack: [Character] = []
    for character in input {
        if character == ")",
           characterStack.last == "(" {
            characterStack.removeLast()
            characterStack.append("2")
        } else if character == "]",
           characterStack.last == "[" {
            characterStack.removeLast()
            characterStack.append("3")
        } else {
            characterStack.append(character)
        }
    }
    let texts: [String] = characterStack.map({ String($0) })
    var stack: [String] = []
    for text in texts {
        switch text {
        case ")":
            guard stack.isEmpty == false else {
                print(0)
                return
            }
            var number: Int = 0
            while let lastNumber = Int(stack.last!) {
                number += lastNumber
                stack.removeLast()
                if stack.isEmpty {
                    print(0)
                    return
                }
            }
            
            guard stack.removeLast() == "(" else {
                print(0)
                return
            }
            stack.append("\(number * 2)")
        case "]":
            guard stack.isEmpty == false else {
                print(0)
                return
            }
            var number: Int = 0
            while let lastNumber = Int(stack.last!) {
                number += lastNumber
                stack.removeLast()
                if stack.isEmpty {
                    print(0)
                    return
                }
            }
            guard stack.removeLast() == "[" else {
                print(0)
                return
            }
            stack.append("\(number * 3)")
        default:
            stack.append(text)
        }
    }
    let result: [Int] = stack.compactMap({ Int($0) })
    if stack.count == result.count {
        print(result.reduce(0, +))
    } else {
        print(0)
    }
}

solution()
