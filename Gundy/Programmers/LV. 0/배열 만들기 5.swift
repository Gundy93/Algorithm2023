func solution(_ intStrs:[String], _ k:Int, _ s:Int, _ l:Int) -> [Int] {
    let numbers = intStrs.map { $0.map(String.init)[s...s + l - 1].joined() }
    return numbers.compactMap(Int.init).filter { $0 > k }
}
