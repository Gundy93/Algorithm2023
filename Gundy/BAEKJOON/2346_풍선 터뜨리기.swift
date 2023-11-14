final class Node<T> {
    
    var value: T
    var left: Node<T>?
    var right: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

struct LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    
    mutating func insert(_ element: T) {
        let node = Node(value: element)
        
        guard let tail = tail else {
            head = node
            tail = node
            return
        }
        
        tail.right = node
        node.left = tail
        self.tail = node
    }
}

let numberOfBalloons = Int(readLine()!)!
let values = readLine()!.split(separator: " ").compactMap { Int($0) }
var list = LinkedList<(Int, Int)>()

for element in values.enumerated() {
    list.insert(element)
}

list.tail?.right = list.head
list.head?.left = list.tail

var result = [String]()
var current = list.head

while result.count < numberOfBalloons {
    guard let value = current?.value else { break }
    
    result.append(String(value.0 + 1))
    current?.left?.right = current?.right
    current?.right?.left = current?.left
    
    if value.1 > 0 {
        for _ in 1...value.1 {
            current = current?.right
        }
    } else {
        for _ in 1...abs(value.1) {
            current = current?.left
        }
    }
}

print(result.joined(separator: " "))
