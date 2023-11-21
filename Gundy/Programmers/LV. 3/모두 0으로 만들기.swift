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

func solution(_ a:[Int], _ edges:[[Int]]) -> Int64 {
    guard a.reduce(0, +) == 0 else { return -1 }
    
    var a = a
    var links = [Int: Set<Int>]()
    
    for edge in edges {
        links[edge[0], default: []].insert(edge[1])
        links[edge[1], default: []].insert(edge[0])
    }
    
    let point = links.keys.map { ($0, links[$0]!.count) }.max { $0.1 < $1.1 }!.0
    var next = Array(repeating: 0, count: a.count)
    var distances = [(Int, Int)]()
    var checkedIndex = Set([point])
    var needCheckList = Queue<(Int, Int)>()
    
    needCheckList.enqueue((point, 0))
    
    while let current = needCheckList.dequeue() {
        distances.append(current)
        
        for index in links[current.0, default: []] {
            guard checkedIndex.contains(index) == false else { continue }
            
            next[index] = current.0
            checkedIndex.insert(index)
            needCheckList.enqueue((index, current.1 + 1))
        }
    }
    
    distances.sort { $0.1 > $1.1 }
    
    let _ = distances.popLast()
    
    var result = 0
    
    for element in distances {
        guard a[element.0] != 0 else { continue }
        
        a[next[element.0]] += a[element.0]
        result += abs(a[element.0])
    }
    
    return Int64(result)
}
