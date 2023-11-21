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

let _ = readLine()
let structures = readLine()!.split(separator: " ").map(String.init)
let numbers = readLine()!.split(separator: " ").map(String.init)
var deque = Deque<String>()

for index in 0...numbers.count - 1 {
    guard structures[index] == "0" else { continue }
    
    deque.pushLast(numbers[index])
}

let _ = readLine()
var result = [String]()

for element in readLine()!.split(separator: " ").map(String.init) {
    deque.pushFirst(element)
    result.append(deque.popLast()!)
}

print(result.joined(separator: " "))
