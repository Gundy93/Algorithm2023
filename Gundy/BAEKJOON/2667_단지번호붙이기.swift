extension Array {
    subscript(safe index: Int) -> Element? {
        guard self.count > index && index >= 0 else {
            return nil
        }
        return self[index]
    }
}

func solution() {
    let size: Int = Int(readLine()!)!
    var townMap: [[Int]] = []
    for _ in 1...size {
        townMap.append(readLine()!.compactMap({ Int(String($0)) }))
    }
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: size), count: size)
    var needVisit: [(Int, Int)] = []
    var sizeOfTowns: [Int] = []
    for x in 0..<size {
        for y in 0..<size {
            if visited[x][y] == 1 {
                continue
            }
            needVisit.append((x, y))
            var count: Int = 0
            while needVisit.isEmpty == false {
                let (x, y) = needVisit.removeLast()
                if visited[x][y] == 1 {
                    continue
                }
                visited[x][y] = 1
                guard townMap[x][y] == 1 else {
                    continue
                }
                count += 1
                if let up = visited[x][safe: y-1],
                   up == 0 {
                    needVisit.append((x, y-1))
                }
                if let down = visited[x][safe: y+1],
                   down == 0 {
                    needVisit.append((x, y+1))
                }
                if let left = visited[safe: x-1]?[y],
                   left == 0 {
                    needVisit.append((x-1, y))
                }
                if let right = visited[safe: x+1]?[y],
                   right == 0 {
                    needVisit.append((x+1, y))
                }
            }
            if count > 0 {
                sizeOfTowns.append(count)
            }
        }
    }
    print(sizeOfTowns.count)
    for size in sizeOfTowns.sorted() {
        print(size)
    }
}

solution()
