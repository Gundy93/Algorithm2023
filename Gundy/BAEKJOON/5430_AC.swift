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
var result = String()

loop: for _ in 1...count {
    let commands = readLine()!
    let _ = readLine()
    var input = readLine()!
    
    input.removeFirst()
    input.removeLast()
    
    var deque = Deque<String>()
    
    for number in input.split(separator: ",").map(String.init) {
        deque.pushLast(number)
    }
    
    var isReversed = false
    
    for command in commands {
        switch command {
        case "R":
            isReversed.toggle()
        default:
            guard deque.first != nil else {
                result += "error\n"
                continue loop
            }
            
            let _ = isReversed ? deque.popLast() : deque.popFirst()
        }
    }
    
    var numbers = "["
    
    if isReversed {
        while let number = deque.popLast() {
            numbers += number + ","
        }
    } else {
        while let number = deque.popFirst() {
            numbers += number + ","
        }
    }
    
    if numbers.last == "," {
        numbers.removeLast()
    }
    
    result += numbers + "]\n"
}

print(result)
