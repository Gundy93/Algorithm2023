func solution(_ n:Int) -> [Int] {
    var number = n
    var result = [number]
    while number != 1 {
        if number % 2 == 0 {
            number /= 2
        } else {
            number = 3 * number + 1
        }
        result.append(number)
    }
    return result
}
