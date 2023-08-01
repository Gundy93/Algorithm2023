func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var log = [Set<String>: Int]()
    for order in orders.map({ Set($0.map(String.init)) }) {
        var visited = Set<Set<String>>()
        var needVisit = order.map { Set([$0]) }
        while needVisit.isEmpty == false {
            let menus = needVisit.removeLast()
            guard visited.contains(menus) == false else { continue }
            visited.insert(menus)
            if course.contains(menus.count) {
                log[menus, default: 0] += 1
            }
            for menu in order {
                guard menus.contains(menu) == false else { continue }
                needVisit.append(menus.union([menu]))
            }
        }
    }
    var courses = [Int: [(String, Int)]]()
    for key in log.keys {
        let count = log[key]!
        if count > 1, courses[key.count] == nil || courses[key.count]![0].1 < count {
            courses[key.count] = [(key.sorted().joined(), count)]
        } else if let course = courses[key.count], course[0].1 == count {
            courses[key.count]!.append((key.sorted().joined(), count))
        }
    }
    var result = [String]()
    for course in courses.values {
        course.forEach { result.append($0.0) }
    }
    return result.sorted()
}
