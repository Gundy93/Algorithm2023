func solution(_ p:String) -> String {
    guard p.isEmpty == false else { return p }
    let input = p.map(String.init)
    var left = String()
    var right = String()
    var openCount = 0
    var closeCount = 0
    for index in 0...input.count - 1 {
        left += input[index]
        if input[index] == "(" {
            openCount += 1
        } else {
            closeCount += 1
        }
        if openCount == closeCount {
            guard index != input.count - 1 else { break }
            right = solution(input[index + 1...input.count - 1].joined())
            break
        }
    }
    if left.first != "(" || left.last != ")" {
        var result = "("
        result += right + ")"
        if left.count > 2 {
            let leftWords = left.map(String.init)
            for index in 1...leftWords.count - 2 {
                if leftWords[index] == "(" {
                    result += ")"
                } else {
                    result += "("
                }
            }
        }
        return result
    } else {
        return left + right
    }
}
