func solution(_ relation:[[String]]) -> Int {
    var result = [Set<Int>]()
    for indices in makeConbination(relation[0].count) {
        guard result.allSatisfy({ $0.isSubset(of: Set(indices)) == false }) else { continue }
        var count = [String: Int]()
        for link in relation {
            var text = String()
            for index in indices {
                text += link[index]
            }
            count[text, default: 0] += 1
        }
        if count.values.max()! == 1 {
            result.append(Set(indices))
        }
    }
    return result.count
}

func makeConbination(_ number: Int) -> [[Int]] {
    let numbers = stride(from: number - 1, through: 0, by: -1)
    var result = [[Int]]()
    var stack = numbers.map { [$0] }
    while stack.isEmpty == false {
        let indices = stack.removeLast()
        result.append(indices)
        for number in numbers {
            guard number > indices.last! else { break }
            stack.append(indices + [number])
        }
    }
    return result.sorted(by: { $0.count < $1.count })
}
