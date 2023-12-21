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

let count = readLine()!.split(separator: " ").map { Int($0)! }.reduce(0, +)
var move = [Int: Int]()

for _ in 1...count {
    let points = readLine()!.split(separator: " ").map { Int($0)! }
    
    move[points[0]] = points[1]
}

var visited = Array(repeating: 0, count: 101)
var queue = Queue<(point: Int, count: Int)>()

queue.enqueue((1, 0))

while let (point, count) = queue.dequeue() {
    guard visited[100] == 0 else { break }
    
    for distance in 1...6 {
        var next = point + distance
        
        if let moved = move[next] {
            next = moved
        }
        
        guard next <= 100,
              visited[next] == 0 else { continue }
        
        visited[next] = count + 1
        queue.enqueue((next, count + 1))
    }
}

print(visited[100])
