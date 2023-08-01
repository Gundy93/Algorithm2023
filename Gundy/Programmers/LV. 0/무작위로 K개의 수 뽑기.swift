func solution(_ arr:[Int], _ k:Int) -> [Int] {
    var result = [Int]()
    var numbers = Set<Int>()
    for number in arr {
        guard numbers.contains(number) == false else { continue }
        result.append(number)
        numbers.insert(number)
    }
    return result.count < k ? result + Array(repeating: -1, count: k - result.count) : Array(result[0...k - 1])
}
