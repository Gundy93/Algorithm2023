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

var result = "use the stairs"
let input = readLine()!.split(separator: " ").map { Int($0)! }
let height = input[0]
let start = input[1]
let target = input[2]
let up = input[3]
let down = input[4]
var visited = Set<Int>()
var queue = Queue<(floor: Int, count: Int)>()

queue.enqueue((start, 0))

while let (floor, count) = queue.dequeue() {
    guard 1...height ~= floor,
          visited.contains(floor) == false else { continue }
    
    visited.insert(floor)
    
    guard floor != target else {
        result = String(count)
        
        break
    }
    
    queue.enqueue((floor + up, count + 1))
    queue.enqueue((floor - down, count + 1))
}

print(result)
