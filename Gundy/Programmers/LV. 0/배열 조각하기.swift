func solution(_ arr:[Int], _ query:[Int]) -> [Int] {
    var result = arr
    for query in query.enumerated() {
        if query.offset % 2 == 0 {
            result = Array(result[0...query.element])
        } else {
            result = Array(result[query.element...result.count - 1])
        }
    }
    return result
}
