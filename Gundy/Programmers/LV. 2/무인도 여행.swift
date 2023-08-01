func solution(_ maps:[String]) -> [Int] {
    var islands = [Int]()
    var maps = maps.map { $0.map(String.init) }
    var visited = Array(repeating: Array(repeating: false, count: maps[0].count), count: maps.count)
    for row in 0..<maps.count {
        for column in 0..<maps[0].count {
            guard visited[row][column] == false, maps[row][column] != "X" else { continue }
            var needVisit = [(row, column)]
            var foods = 0
            while needVisit.isEmpty == false {
                let point = needVisit.removeLast()
                guard visited[point.0][point.1] == false else {
                    continue
                }
                visited[point.0][point.1] = true
                foods += Int(maps[point.0][point.1])!
                for (x, y) in zip([0, 0, 1, -1], [1, -1, 0, 0]) {
                    guard point.0 + x >= 0, point.0 + x < maps.count, point.1 + y >= 0, point.1 + y < maps[0].count, maps[point.0 + x][point.1 + y] != "X" else { continue }
                    needVisit.append((point.0 + x, point.1 + y))
                }
            }
            islands.append(foods)
        }
    }
    return islands.isEmpty ? [-1] : islands.sorted()
}
