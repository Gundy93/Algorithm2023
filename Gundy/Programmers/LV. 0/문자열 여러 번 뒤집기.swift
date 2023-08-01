func solution(_ my_string:String, _ queries:[[Int]]) -> String {
    var result = my_string.map(String.init)
    for query in queries {
        result = stride(from: 0, to: query[0], by: 1).map { result[$0] } + result[query[0]...query[1]].reversed() + stride(from: query[1] + 1, to: result.count, by: 1).map { result[$0] }
    }
    return result.joined()
}
