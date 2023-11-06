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

func solution(length: Int, now: [Int], target: [Int]) {
    let row: [Int] = Array(repeating: -1, count: length)
    var board: [[Int]] = Array(repeating: row, count: length)
    board[now.first!][now.last!] = 0
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: length), count: length)
    var needVisit: Queue<[Int]> = Queue()
    needVisit.enqueue([now.first!, now.last!])
    let axisX: [Int] = [-2, -1, 1, 2, 2, 1, -1, -2]
    let axisY: [Int] = [1, 2, 2, 1, -1, -2, -2, -1]
    while needVisit.isEmpty == false {
        let current: [Int] = needVisit.dequeue()!
        let x: Int = current[0]
        let y: Int = current[1]
        guard visited[x][y] == false else { continue }
        if current == target {
            print(board[x][y])
            return
        }
        visited[x][y] = true
        for (deltaX, deltaY) in zip(axisX, axisY) {
            if board[safe: x + deltaX]?[safe: y + deltaY] == -1 {
                board[x + deltaX][y + deltaY] = board[x][y] + 1
                needVisit.enqueue([x + deltaX, y + deltaY])
            }
        }
    }
}

let count: Int = Int(readLine()!)!
for _ in 1...count {
    let length: Int = Int(readLine()!)!
    let now: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let target: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    solution(length: length, now: now, target: target)
}
