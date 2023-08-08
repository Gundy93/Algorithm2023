func solution(_ s:String) -> Int {
    let s = s.map(String.init)
    var result = s.count
    for length in stride(from: 1, through: result / 2, by: 1) {
        var stack = [String]()
        var text = String()
        for word in s {
            text += word
            if text.count == length {
                stack.append(text)
                text.removeAll()
            }
        }
        if text.isEmpty == false {
            stack.append(text)
        }
        var compressed = String()
        var count = 1
        var index = 1
        var word = stack[0]
        while index < stack.count {
            if stack[index] == word {
                count += 1
                index += 1
            } else {
                compressed += count > 1 ? String(count) + word : word
                word = stack[index]
                count = 1
                index += 1
            }
        }
        compressed += count > 1 ? String(count) + word : word
        if compressed.count < result {
            result = compressed.count
        }
    }
    return result
}
