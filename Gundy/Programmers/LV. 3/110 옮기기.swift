func solution(_ s:[String]) -> [String] {
    return s.map(recursion)
}

func recursion(_ text: String) -> String {
    var stack = [String]()
    var count = 0
    let text = text.map(String.init)
    var index = 0
    while index < text.count - 2 {
        if text[index...index + 2] == ["1", "1", "0"] {
            count += 1
            index += 3
        } else {
            stack.append(text[index])
            if stack.count >= 3, stack[stack.count - 3...stack.count - 1] == ["1", "1", "0"] {
                count += 1
                stack.removeLast(3)
            }
            index += 1
        }
    }
    while index < text.count {
        stack.append(text[index])
        if stack.count >= 3, stack[stack.count - 3...stack.count - 1] == ["1", "1", "0"] {
            count += 1
            stack.removeLast(3)
        }
        index += 1
    }
    index = stack.count - 1
    while index >= 0, stack[index] != "0" {
        index -= 1
    }
    var result = String()
    for index in stride(from: 0, through: index, by: 1) {
        result += stack[index]
    }
    result += Array(repeating: "110", count: count).joined()
    for index in stride(from: index + 1, to: stack.count, by: 1) {
        result += stack[index]
    }
    return result
}
