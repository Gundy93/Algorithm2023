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

var queue = Queue<Int>()
let count = Int(readLine()!)!

for number in 1...count {
    queue.enqueue(number)
}

for _ in stride(from: 1, to: count, by: 1) {
    let _ = queue.dequeue()
    guard let element = queue.dequeue() else { break }
    
    queue.enqueue(element)
}

print(queue.last!)
