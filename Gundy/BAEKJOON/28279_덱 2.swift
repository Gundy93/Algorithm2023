struct Deque<T> {
    
    final class Node {
        
        let value: T
        var previous: Node?
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
    
    mutating func pushFirst(_ newElement: T) {
        let node = Node(value: newElement)
        
        guard let first = head else {
            head = node
            tail = node
            
            return
        }
        
        first.previous = node
        node.next = first
        head = node
    }
    
    mutating func pushLast(_ newElement: T) {
        let node = Node(value: newElement)
        
        guard let last = tail else {
            head = node
            tail = node
            
            return
        }
        
        last.next = node
        node.previous = last
        tail = node
    }
    
    mutating func popFirst() -> T? {
        let element = first
        
        guard head != nil else { return element }
        
        if head === tail {
            head = nil
            tail = nil
        } else {
            head = head?.next
        }
        
        return element
    }
    
    mutating func popLast() -> T? {
        let element = last
        
        guard tail != nil else { return element }
        
        if head === tail {
            head = nil
            tail = nil
        } else {
            tail = tail?.previous
        }
        
        return element
    }
}

let count = Int(readLine()!)!
var deque = Deque<String>()
var size = 0
var result = String()

for _ in 1...count {
    let command = readLine()!.split(separator: " ").map(String.init)
    
    switch command[0] {
    case "1":
        deque.pushFirst(command[1])
        size += 1
    case "2":
        deque.pushLast(command[1])
        size += 1
    case "3":
        result += "\(deque.popFirst() ?? "-1")\n"
        if size > 0 {
            size -= 1
        }
    case "4":
        result += "\(deque.popLast() ?? "-1")\n"
        if size > 0 {
            size -= 1
        }
    case "5":
        result += "\(size)\n"
    case "6":
        result += "\(size == 0 ? 1 : 0)\n"
    case "7":
        result += "\(deque.first ?? "-1")\n"
    default:
        result += "\(deque.last ?? "-1")\n"
    }
}

print(result)
