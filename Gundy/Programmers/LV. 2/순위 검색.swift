func solution(_ info:[String], _ query:[String]) -> [Int] {
    var log = [String: [Int]]()
    let info = info.map { $0.split(separator: " ").map(String.init) }.sorted { Int($0[4])! > Int($1[4])! }
    for texts in info {
        let languages = [texts[0], "-"]
        let positions = [texts[1], "-"]
        let careers = [texts[2], "-"]
        let foods = [texts[3], "-"]
        let point = Int(texts[4])!
        for language in languages {
            for position in positions {
                for career in careers {
                    for food in foods {
                        let key = language + position + career + food
                        log[key, default: []].append(point)
                    }
                }
            }
        }
    }
    var result = [Int]()
    for command in query {
        let order = command.split(separator: " ").map(String.init)
        let key = order[0] + order[2] + order[4] + order[6]
        let point = Int(order[7])!
        guard let points = log[key] else {
            result.append(0)
            continue
        }
        var start = 0
        var end = points.count - 1
        while start <= end {
            let half = (start + end) / 2
            if points[half] >= point {
                start = half + 1
            } else {
                end = half - 1
            }
        }
        result.append(end >= 0 ? end + 1 : 0)
    }
    return result
}
