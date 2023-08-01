func solution(_ rank:[Int], _ attendance:[Bool]) -> Int {
    let result = rank.enumerated().filter { attendance[$0.offset] }.sorted { $0.element < $1.element }.map { $0.offset }
    return 10000 * result[0] + 100 * result[1] + result[2]
}
