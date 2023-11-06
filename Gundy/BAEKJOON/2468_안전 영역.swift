extension Array {
    subscript(safe index: Int) -> Element? {
        guard self.count > index && index >= 0 else {
            return nil
        }
        return self[index]
    }
}

struct Queue<T> {
    private var left: [T] = []
    private var right: [T] = []
    var isEmpty: Bool {
        return left.isEmpty && right.isEmpty
    }
    
    mutating func enqueue(_ value: T) {
        right.append(value)
    }
    
    mutating func dequeue() -> T? {
        if left.isEmpty {
            left = right.reversed()
            right = []
        }
        return left.popLast()
    }
}

func solution() {
    var length: Int = Int(readLine()!)!
    var townMap: [[Int]] = []
    for _ in 1...length {
        let row: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
        townMap.append(row)
    }
    let maximumHeight: Int = townMap.flatMap({ $0 }).sorted().last! - 1
    let axisX: [Int] = [0, 0, 1, -1]
    let axisY: [Int] = [1, -1, 0, 0]
    var result: [Int] = []
    for rainHeight in 0...maximumHeight {
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: length), count: length)
        var needVisit: Queue<[Int]> = Queue()
        var count: Int = 0
        for x in 0..<length {
            for y in 0..<length {
                var isValidArea: Bool = false
                guard visited[x][y] == false else { continue }
                if townMap[x][y] > rainHeight {
                    needVisit.enqueue([x, y])
                }
                while needVisit.isEmpty == false {
                    let position: [Int] = needVisit.dequeue()!
                    let x: Int = position[0]
                    let y: Int = position[1]
                    guard visited[x][y] == false else { continue }
                    visited[x][y] = true
                    isValidArea = true
                    for (deltaX, deltaY) in zip(axisX, axisY) {
                        if let height = townMap[safe: x + deltaX]?[safe: y + deltaY],
                           height > rainHeight {
                            needVisit.enqueue([x + deltaX, y + deltaY])
                        }
                    }
                }
                if isValidArea {
                    count += 1
                }
            }
        }
        result.append(count)
    }
    print(result.sorted().last!)
}

solution()
