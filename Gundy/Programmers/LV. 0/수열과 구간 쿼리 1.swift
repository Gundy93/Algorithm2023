func solution(_ arr:[Int], _ queries:[[Int]]) -> [Int] {
    var numbers = arr
    for query in queries {
        for index in query[0]...query[1] {
            numbers[index] += 1
        }
    }
    return numbers
}
