func solution(_ numLog:[Int]) -> String {
    var number = numLog[0]
    var result = String()
    for index in 1...numLog.count - 1 {
        let next = numLog[index]
        switch next - number {
        case 1:
            result += "w"
        case -1:
            result += "s"
        case 10:
            result += "d"
        default:
            result += "a"
        }
        number = next
    }
    return result
}
