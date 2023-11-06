extension Array {
    subscript(safe index: Index) -> Element? {
        guard index >= 0,
              index < count else { return nil }
        return self[index]
    }
}

func solution() {
    let length = Int(readLine()!)!
    var area = [[Character]]()
    for _ in 1...length {
        area.append(readLine()!.map({ $0 }))
    }
    var visitedForOrdinary = Array(repeating: Array(repeating: false, count: length), count: length)
    var visited = visitedForOrdinary
    var ordinaryResult = 0
    var result = 0
    for row in 0..<length {
        for column in 0..<length {
            guard visitedForOrdinary[row][column] == false else { continue }
            let color = area[row][column]
            var needVisit = [(row, column)]
            while needVisit.isEmpty == false {
                let point = needVisit.removeLast()
                guard area[point.0][point.1] == color,
                      visitedForOrdinary[point.0][point.1] == false else { continue }
                if area[point.0][point.1] == "R" {
                    area[point.0][point.1] = "G"
                }
                visitedForOrdinary[point.0][point.1] = true
                for (x, y) in zip([0, 0, 1, -1], [1, -1, 0, 0]) {
                    if visitedForOrdinary[safe: point.0 + x]?[safe: point.1 + y] == false {
                        needVisit.append((point.0 + x, point.1 + y))
                    }
                }
            }
            ordinaryResult += 1
        }
    }
    for row in 0..<length {
        for column in 0..<length {
            guard visited[row][column] == false else { continue }
            let color = area[row][column]
            var needVisit = [(row, column)]
            while needVisit.isEmpty == false {
                let point = needVisit.removeLast()
                guard area[point.0][point.1] == color,
                      visited[point.0][point.1] == false else { continue }
                if area[point.0][point.1] == "R" {
                    area[point.0][point.1] = "G"
                }
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
    print(ordinaryResult, result)
}

solution()
