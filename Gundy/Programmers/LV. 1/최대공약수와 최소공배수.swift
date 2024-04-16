func solution(_ n:Int, _ m:Int) -> [Int] {
    var lhs = n
    var rhs = m
    var divisor = 2
    var result = [1, 1]
    
    while divisor <= lhs || divisor <= rhs {
        switch (lhs % divisor, rhs % divisor) {
        case (0, 0):
            result[0] *= divisor
            lhs /= divisor
            rhs /= divisor
        case (0, _):
            result[1] *= divisor
            lhs /= divisor
        case (_, 0):
            result[1] *= divisor
            rhs /= divisor
        default:
            divisor += 1
        }
    }
    
    result[1] *= lhs
    result[1] *= rhs
    result[1] *= result[0]
    
    return result
}
