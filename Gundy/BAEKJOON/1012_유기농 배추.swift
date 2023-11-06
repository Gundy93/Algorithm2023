extension Array {
    subscript(safe index: Index) -> Element? {
        guard index >= 0,
              index < count else { return nil }
        return self[index]
    }
}

func solution() {
    let times = Int(readLine()!)!
    for _ in 1...times {
        let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
        let width = input[0]
        let height = input[1]
        let numberOfCabagges = input[2]
        var field = Array(repeating: Array(repeating: 0, count: height), count: width)
        for _ in 1...numberOfCabagges {
            let point = readLine()!.split(separator: " ").compactMap({ Int($0) })
            let x = point[0]
            let y = point[1]
            field[x][y] = 1
        }
        var visited = Array(repeating: Array(repeating: false, count: height), count: width)
        var result = 0
        for row in 0..<width {
            for column in 0..<height {
                guard field[row][column] == 1,
                      visited[row][column] == false else { continue }
                var needVisit = [(row, column)]
                while needVisit.isEmpty == false {
                    let point = needVisit.removeLast()
                    guard field[point.0][point.1] == 1,
                          visited[point.0][point.1] == false else { continue }
                    visited[point.0][point.1] = true
                    for (x, y) in zip([0, 0, 1, -1], [1, -1, 0, 0]) {
                        if visited[safe: point.0 + x]?[safe: point.1 + y] == false {
                            needVisit.append((point.0 + x, point.1 + y))
                        }
                    }
                }
                result += 1
            }
        }
        print(result)
    }
}

solution()
