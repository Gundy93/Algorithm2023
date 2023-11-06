extension Array {
    subscript(safe index: Int) -> Element? {
        guard self.count > index && index >= 0 else {
            return nil
        }
        return self[index]
    }
}

func solution() {
    let size: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    var image: [[Int]] = []
    for _ in 1...size[0] {
        image.append(readLine()!.split(separator: " ").compactMap({ Int($0) }))
    }
    var visited: [[Int]] = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
    var needVisit: [(Int, Int)] = []
    var maximumCount: Int = 0
    var numberOfImages: Int = 0
    for x in 0...size[0]-1 {
        for y in 0...size[1]-1 {
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
                guard image[x][y] == 1 else {
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
                numberOfImages += 1
            }
            if count > maximumCount {
                maximumCount = count
            }
        }
    }
    print(numberOfImages)
    print(maximumCount)
}

solution()
