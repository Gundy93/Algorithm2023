func solution(_ picture:[String], _ k:Int) -> [String] {
    var picture = picture.map { $0.map { String(repeating: $0, count: k) }.joined() }
    var result = [String]()
    picture.forEach { result += Array(repeating: $0, count: k) }
    return result
}
