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
    var count: Int = 0
    var isEmpty: Bool {
        return count == 0
    }
    
    mutating func enqueue(_ newElement: T) {
        let node = Node(value: newElement)
        
        count += 1
        
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
        
        if count > 0 {
            count -= 1
        }
        
        return element
    }
}

let count = Int(readLine()!)!
var queue = Queue<String>()

for _ in 1...count {
    let command = readLine()!.split(separator: " ").map(String.init)
    
    switch command[0] {
    case "push":
        queue.enqueue(command[1])
    case "pop":
        print(queue.dequeue() ?? "-1")
    case "size":
        print(queue.count)
    case "empty":
        print(queue.isEmpty ? 1 : 0)
    case "front":
        print(queue.first ?? "-1")
    default:
        print(queue.last ?? "-1")
    }
}
