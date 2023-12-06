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

typealias BoardIndex = (row: Int, column: Int, isBroken: Int)

let size = readLine()!.split(separator: " ").map { Int($0)! }
var board = [[Character]]()

for _ in 1...size[0] {
    board.append(Array(readLine()!))
}

var visitied = Array(repeating: Array(repeating: [0, 0], count: size[1]), count: size[0])
var needVisit = Queue<BoardIndex>()
var result = -1

visitied[0][0][0] = 1
needVisit.enqueue((0, 0, 0))

while needVisit.isEmpty == false {
    let current = needVisit.dequeue()!
    
    guard (current.row == size[0] - 1 && current.column == size[1] - 1) == false else {
        result = visitied[current.row][current.column][current.isBroken]
        
        break
    }
    
    for (nextRow, nextColumn) in zip([0, 0, -1, 1], [-1, 1, 0, 0]) {
        let row = current.row + nextRow
        let column = current.column + nextColumn
        
        guard row >= 0, row < size[0],
              column >= 0, column < size[1] else { continue }
        
        if board[row][column] == "0",
           visitied[row][column][current.isBroken] == 0 {
            visitied[row][column][current.isBroken] = visitied[current.row][current.column][current.isBroken] + 1
            needVisit.enqueue((row, column, current.isBroken))
        } else if current.isBroken == 0,
                  visitied[row][column][1] == 0 {
            visitied[row][column][1] = visitied[current.row][current.column][current.isBroken] + 1
            needVisit.enqueue((row, column, 1))
        }
    }
}

print(result)
