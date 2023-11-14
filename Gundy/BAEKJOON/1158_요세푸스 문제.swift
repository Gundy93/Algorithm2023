final class Node<T> {
    
    var value: T
    var next: Node<T>?
    
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
        
        tail.next = node
        self.tail = node
    }
}

let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var list = LinkedList<Int>()

for number in 1...input[0] {
    list.insert(number)
}

list.tail?.next = list.head

var result = [String]()
var current = list.tail

while result.count < input[0] {
    for _ in stride(from: 1, to: input[1], by: 1) {
        current = current?.next
    }
    
    guard let next = current?.next else { break }
    
    result.append(String(next.value))
    current?.next = next.next
}

print("<" + result.joined(separator: ", ") + ">")
