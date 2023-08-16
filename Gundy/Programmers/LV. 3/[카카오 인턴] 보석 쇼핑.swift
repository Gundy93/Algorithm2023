func solution(_ gems:[String]) -> [Int] {
    var result = [1, gems.count]
    let gemKind = Set(gems).count
    var start = 0
    var end = 0
    var list = Set([gems[0]])
    guard list.count < gemKind else { return [1, 1] }
    var count = [String: Int]()
    count[gems[0]] = 1
    while end < gems.count {
        if list.count == gemKind {
            if result[1] - result[0] > end - start {
                result = [start + 1, end + 1]
            }
            count[gems[start]]! -= 1
            if count[gems[start]] == 0 {
                list.remove(gems[start])
            }
            start += 1
        } else {
            end += 1
            if end < gems.count {
                count[gems[end], default: 0] += 1
                if count[gems[end]] == 1 {
                    list.insert(gems[end])
                }
            }
        }
    }
    return result
}
