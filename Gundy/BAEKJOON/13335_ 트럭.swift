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

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (numberOfTrucks, length, limit) = (input[0], input[1], input[2])
let trucks = readLine()!.split(separator: " ").map { Int($0)! }
var weight = 0
var result = 0
var queue = Queue<(Int, Int)>()

for truck in trucks {
    while weight + truck > limit {
        let (time, first) = queue.dequeue()!
        
        result = time
        weight -= first
    }
    
    queue.enqueue((result + length, truck))
    result += 1
    weight += truck
    
    while let (time, first) = queue.first,
          result >= time {
        weight -= first
        _ = queue.dequeue()
    } 
}

result += length
print(result)
