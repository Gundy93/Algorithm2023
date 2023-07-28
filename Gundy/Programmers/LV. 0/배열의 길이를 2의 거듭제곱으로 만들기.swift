func solution(_ arr:[Int]) -> [Int] {
    var number = 1
    while arr.count > number {
        number *= 2
    }
    return arr + Array(repeating: 0, count: number - arr.count)
}
