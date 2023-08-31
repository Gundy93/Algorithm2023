func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var links = [Int: (Int?, [Int])]()
    for edge in edges {
        links[edge[0], default: (nil, [])].1.append(edge[1])
        links[edge[1], default: (nil, [])].0 = edge[0]
    }
    var result = 1
    var visited = [[Int]: [[[Int]]]]()
    func recursion(_ from: Int, _ to: Int, _ sheeps: [Int], _ wolves: [Int]) {
        guard sheeps.count > wolves.count, visited[[from, to], default: []].contains([sheeps, wolves]) == false else { return }
        visited[[from, to], default: []].append([sheeps, wolves])
        var sheeps = sheeps
        var wolves = wolves
        if info[to] == 0, sheeps.contains(to) == false {
            sheeps.append(to)
            result = max(result, sheeps.count)
        } else if info[to] == 1, wolves.contains(to) == false {
            wolves.append(to)
        }
        for child in links[to]!.1 {
            recursion(to, child, sheeps, wolves)
        }
        if let parent = links[to]!.0 {
            recursion(to, parent, sheeps, wolves)
        }
    }
    recursion(0, 0, [0], [])
    return result
}
