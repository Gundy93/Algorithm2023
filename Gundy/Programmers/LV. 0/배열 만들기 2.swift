func solution(_ l:Int, _ r:Int) -> [Int] {
    var numbers = stride(from: l / 5, through: r / 5, by: 1).filter { isValid($0) }.map { $0 * 5 }
    guard numbers.isEmpty == false else { return [-1] }
    if numbers[0] < l {
        numbers.reverse()
        numbers.removeLast()
        numbers.reverse()
    }
    return numbers.isEmpty ? [-1] : numbers
}

func isValid(_ number: Int) -> Bool {
    let number = Set(String(number).compactMap { Int(String($0)) })
    for bannedNumber in 2...9 {
        if number.contains(bannedNumber) {
            return false
        }
    }
    return true
}
