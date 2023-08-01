func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = [Int]()
    for query in queries {
        let minimum = stride(from: query[0], through: query[1], by: 1).map { arr[$0] }.filter { $0 > query[2] }.min()
        result.append(minimum ?? -1)
    }
    return result
}
