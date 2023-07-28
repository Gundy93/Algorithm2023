func solution(_ myStr:String) -> [String] {
    let separators = Set(["a", "b", "c"])
    var result = [String]()
    var stack = String()
    for text in myStr.map(String.init) {
        if separators.contains(text) {
            if stack.isEmpty == false {
                result.append(stack)
                stack.removeAll()
            }
        } else {
            stack += text
        }
    }
    if stack.isEmpty == false {
        result.append(stack)
    }
    return result.isEmpty ? ["EMPTY"] : result
}
