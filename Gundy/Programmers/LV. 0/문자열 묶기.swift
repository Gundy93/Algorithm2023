func solution(_ strArr:[String]) -> Int {
    var groups = [Int: Int]()
    for text in strArr {
        groups[text.count, default: 0] += 1
    }
    return groups.values.max()!
}
