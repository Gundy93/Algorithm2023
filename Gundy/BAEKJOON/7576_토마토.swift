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

let size = readLine()!.split(separator: " ").map { Int($0)! }
let width = size[0]
let height = size[1]
var box = [[Int]]()

for _ in 1...height {
    box.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var queue = Queue<(row: Int, column: Int)>()

for row in 0...height - 1 {
    for column in 0...width - 1 {
        if box[row][column] == 1 {
            queue.enqueue((row, column))
        }
    }
}

var result = 0
let delta = zip([-1, 1, 0, 0], [0, 0, -1, 1])

while let (row, column) = queue.dequeue() {
    let number = box[row][column]
    
    for (deltaRow, deltaColumn) in delta {
        let nextRow = row + deltaRow
        let nextColumn = column + deltaColumn
        
        guard 0...height - 1 ~= nextRow,
              0...width - 1 ~= nextColumn,
              box[nextRow][nextColumn] == 0 else { continue }
        
        result = max(result, number)
        box[nextRow][nextColumn] = number + 1
        queue.enqueue((nextRow, nextColumn))
    }
}

if Set(box.flatMap { $0 }).contains(0) {
    print(-1)
} else {
    print(result)
}
