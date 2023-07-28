func solution(_ binomial:String) -> Int {
    let binomial = binomial.split(separator: " ")
    let numbers = binomial.compactMap { Int($0) }
    switch binomial[1] {
    case "+":
        return numbers[0] + numbers[1]
    case "-":
        return numbers[0] - numbers[1]
    default:
        return numbers[0] * numbers[1]
    }
}
