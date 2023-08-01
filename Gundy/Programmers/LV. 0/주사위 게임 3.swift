func solution(_ a:Int, _ b:Int, _ c:Int, _ d:Int) -> Int {
    var count = [Int: Int]()
    for number in [a, b, c, d] {
        count[number, default: 0] += 1
    }
    let numbers = Array(Set([a, b, c, d]))
    switch numbers.count {
    case 1:
        return 1111 * a
    case 2:
        if count[numbers[0]] == 2 {
            return (numbers[0] + numbers[1]) * abs(numbers[0] - numbers[1])
        } else {
            return count[numbers[0]] == 3 ? (10 * numbers[0] + numbers[1]) * (10 * numbers[0] + numbers[1]) : (10 * numbers[1] + numbers[0]) * (10 * numbers[1] + numbers[0])
        }
    case 3:
        if count[numbers[0]] == 1 {
            return count[numbers[1]] == 1 ? numbers[0] * numbers[1] : numbers[0] * numbers[2]
        } else {
            return numbers[1] * numbers[2]
        }
    default:
        return numbers.min()!
    }
}
