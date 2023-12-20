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
var links = [Int: Set<Int>]()

for _ in 1...input[1] {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].insert(link[1])
    links[link[1], default: []].insert(link[0])
}

var visited = Array(repeating: "0", count: input[0])
var count = 2

func bfs(_ node: Int) {
    var queue = Queue<Int>()
    
    queue.enqueue(node)
    visited[node - 1] = "1"
    
    while let current = queue.dequeue() {
        for next in links[current, default: []].sorted(by: >) {
            guard visited[next - 1] == "0" else { continue }
            
            queue.enqueue(next)
            visited[next - 1] = String(count)
            count += 1 
        }
    }
}

bfs(input[2])

print(visited.joined(separator: "\n"))
