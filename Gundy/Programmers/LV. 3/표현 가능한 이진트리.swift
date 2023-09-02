func solution(_ numbers:[Int64]) -> [Int] {
    return numbers.map({ validate(Int($0)) })
}

func validate(_ number: Int) -> Int {
    var decimal = 1
    var binary = 1
    while decimal < number {
        binary *= 2
        decimal += binary
    }
    var number = String(number, radix: 2).map(String.init)
    var count = 1
    binary = 1
    while count < number.count {
        binary *= 2
        count += binary
    }
    number = Array(repeating: "0", count: count - number.count) + number
    var isValid = true
    func recursion(_ index: Int, _ term: Int, _ isSuperDummy: Bool) {
        guard isValid else { return }
        guard (isSuperDummy && number[index] == "1") == false else {
            isValid = false
            return
        }
        guard term > 0 else { return }
        recursion(index - term, term / 2, number[index] == "0")
        recursion(index + term, term / 2, number[index] == "0")
    }
    recursion(number.count / 2, (number.count / 2 + 1) / 2, false)
    return isValid ? 1 : 0
}
