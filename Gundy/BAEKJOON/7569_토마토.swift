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
let count = size[2]
var boxes = [[[Int]]]()

for _ in 1...count {
    var box = [[Int]]()
    
    for _ in 1...height {
        box.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    boxes.append(box)
}

var queue = Queue<(row: Int, column: Int, zPosition: Int)>()

for zPosition in 0...count - 1 {
    for row in 0...height - 1 {
        for column in 0...width - 1 {
            if boxes[zPosition][row][column] == 1 {
                queue.enqueue((row, column, zPosition))
            }
        }
    }
}

var result = 0
let delta = zip(zip([-1, 1, 0, 0, 0, 0], [0, 0, -1, 1, 0, 0]), [0, 0, 0, 0, -1, 1])

while let (row, column, zPosition) = queue.dequeue() {
    let number = boxes[zPosition][row][column]
    
    for ((deltaRow, deltaColumn), deltaZ) in delta {
        let nextRow = row + deltaRow
        let nextColumn = column + deltaColumn
        let nextZ = zPosition + deltaZ
        
        guard 0...height - 1 ~= nextRow,
              0...width - 1 ~= nextColumn,
              0...count - 1 ~= nextZ,
              boxes[nextZ][nextRow][nextColumn] == 0 else { continue }
        
        result = max(result, number)
        boxes[nextZ][nextRow][nextColumn] = number + 1
        queue.enqueue((nextRow, nextColumn, nextZ))
    }
}

if Set(boxes.flatMap { $0.flatMap { $0 } }).contains(0) {
    print(-1)
} else {
    print(result)
}
