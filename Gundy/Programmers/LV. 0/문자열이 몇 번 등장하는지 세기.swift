func solution(_ myString:String, _ pat:String) -> Int {
    var result = 0
    var stack = String()
    var text = myString.map(String.init)
    while text.isEmpty == false {
        stack = text.removeLast() + stack
        if stack.contains(pat) {
            result += 1
            while stack.contains(pat) {
                stack.removeLast()
            }
        }
    }
    return result
}
