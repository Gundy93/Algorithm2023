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

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var left = 0
    var leftQueue = Queue<Int>()
    
    for number in queue1 {
        left += number
        leftQueue.enqueue(number)
    }
    
    var right = 0
    var rightQueue = Queue<Int>()
    
    for number in queue2 {
        right += number
        rightQueue.enqueue(number)
    }
    
    let total = left + right
    
    guard total % 2 == 0 else { return -1 }
    
    var count = 0
    
    while left != right,
          count < (queue1.count + queue2.count) * 2 {
        if left > right {
            guard let number = leftQueue.dequeue() else { return -1 }
            
            left -= number
            right += number
            rightQueue.enqueue(number)
        } else {
            guard let number = rightQueue.dequeue() else { return -1 }
            
            right -= number
            left += number
            leftQueue.enqueue(number)
        }
        
        count += 1
    }
    
    return left == right ? count : -1
}
