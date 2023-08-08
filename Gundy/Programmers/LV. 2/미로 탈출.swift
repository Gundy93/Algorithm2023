struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { output.isEmpty && input.isEmpty }
    
    init(_ elements: [T]) {
        input = elements
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            guard input.isEmpty == false else { return nil }
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func solution(_ maps:[String]) -> Int {
    let map = maps.map { $0.map(String.init) }
    var beginRow = 0
    var beginColumn = 0
    finding: for row in 0...map.count - 1 {
        for column in 0...map[0].count - 1 {
            if map[row][column] == "S" {
                beginRow = row
                beginColumn = column
                break finding
            }
        }
    }
    var result = 0
    var isFound = false
    var visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
    var needVisit = Queue([(beginRow, beginColumn, 0)])
    while needVisit.isEmpty == false {
        let current = needVisit.dequeue()!
        guard visited[current.0][current.1] == false else { continue }
        guard map[current.0][current.1] != "L" else {
            isFound = true
            needVisit = Queue([(current.0, current.1, current.2)])
            visited = Array(repeating: Array(repeating: false, count: map[0].count), count: map.count)
            break
        }
        visited[current.0][current.1] = true
        for (y, x) in zip([-1, 1, 0, 0],[0, 0, -1, 1]) {
            let row = current.0 + y
            let column = current.1 + x
            guard row >= 0, row < map.count, column >= 0, column < map[0].count, map[row][column] != "X" else { continue }
            needVisit.enqueue((row, column, current.2 + 1))
        }
    }
    guard isFound else { return -1 }
    var isEnd = false 
    while needVisit.isEmpty == false {
        let current = needVisit.dequeue()!
        guard visited[current.0][current.1] == false else { continue }
        guard map[current.0][current.1] != "E" else {
            isEnd = true
            result = current.2
            break
        }
        visited[current.0][current.1] = true
        for (y, x) in zip([-1, 1, 0, 0],[0, 0, -1, 1]) {
            let row = current.0 + y
            let column = current.1 + x
            guard row >= 0, row < map.count, column >= 0, column < map[0].count, map[row][column] != "X" else { continue }
            needVisit.enqueue((row, column, current.2 + 1))
        }
    }
    return isEnd ? result : -1
}
