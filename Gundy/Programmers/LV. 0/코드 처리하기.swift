func solution(_ code:String) -> String {
    var result = String()
    var isModeZero = true
    for word in code.map(String.init).enumerated() {
        guard word.element != "1" else {
            isModeZero.toggle()
            continue
        }
        switch (isModeZero, word.offset % 2) {
        case (true, 0), (false, 1):
            result += word.element
        default:
            continue
        }
    }
    return result.isEmpty ? "EMPTY" : result
}
