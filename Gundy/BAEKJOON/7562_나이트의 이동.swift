struct Queue<T> {
    
    final class Node {
        
        let value: T
        var next: Node?
        
        init(value: T) {
            self.value = value
        }
    }
    
    private var head: Node?
    private var tail: Node?
    var first: T? {
        return head?.value
    }
    var last: T? {
        return tail?.value
    }
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func enqueue(_ newElement: T) {
        let node = Node(value: newElement)
        
        guard let lastNode = tail else {
            head = node
            tail = node
            
            return
        }
        
        lastNode.next = node
        tail = node
    }
    
    mutating func dequeue() -> T? {
        let element = first
        
        if head?.next == nil {
            tail = nil
        }
        
        head = head?.next
        
        return element
    }
}

let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    let length = Int(readLine()!)!
    let now = readLine()!.split(separator: " ").map { Int($0)! }
    let target = readLine()!.split(separator: " ").map { Int($0)! }
    var board = Array(repeating: Array(repeating: 0, count: length), count: length)
    var queue = Queue<(row: Int, column: Int)>()
    
    queue.enqueue((now[0], now[1]))
    
    while let (row, column) = queue.dequeue() {
        guard (row == target[0] && column == target[1]) == false else { break }
        
        for (nextRow, nextColumn) in zip([-2, -1, 1, 2, 2, 1, -1, -2],
                                         [1, 2, 2, 1, -1, -2, -2, -1]) {
            let nextRow = row + nextRow
            let nextColumn = column + nextColumn
            
            guard nextRow >= 0, nextRow < length,
                  nextColumn >= 0, nextColumn < length,
                  board[nextRow][nextColumn] == 0 else { continue }
            
            board[nextRow][nextColumn] = board[row][column] + 1
            queue.enqueue((nextRow, nextColumn))
        }
    }
    
    result += "\(board[target[0]][target[1]])\n"
}

print(result)
