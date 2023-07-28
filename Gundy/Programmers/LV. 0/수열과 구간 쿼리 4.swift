func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var result = arr
    for query in queries {
        let remaining = query[0] % query[2]
        for index in stride(from: remaining == 0 ? query[0] : query[0] + query[2] - remaining, through: query[1], by: query[2]) {
            result[index] += 1
        }
    }
    return result
}
