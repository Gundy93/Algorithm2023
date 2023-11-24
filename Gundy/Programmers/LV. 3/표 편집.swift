final class Node {
    
    let value: Int
    var up: Node?
    var down: Node?
    
    init(value: Int) {
        self.value = value
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var head: Node? = Node(value: 0)
    var current = head
    
    for number in stride(from: 1, to: n, by: 1) {
        let node = Node(value: number)
        
        current?.down = node
        node.up = current
        current = node
    }
    
    current = head
    
    while let value = current?.value,
          value < k {
        current = current?.down
    }
    
    var removedNodes = [Node?]()
    
    for command in cmd {
        switch command {
        case "C":
            current?.up?.down = current?.down
            current?.down?.up = current?.up
            removedNodes.append(current)
            
            if head === current {
                head = head?.down
            }
            
            current = current?.down != nil ? current?.down : current?.up
        case "Z":
            guard removedNodes.isEmpty == false else { continue }
            
            let node = removedNodes.removeLast()
            
            node?.up?.down = node
            node?.down?.up = node
            
            if let nodeValue = node?.value,
               let headValue = head?.value,
               nodeValue < headValue {
                head = node
            }
        default:
            let input = command.split(separator: " ").map(String.init)
            
            if input[0] == "U" {
                for _ in 1...Int(input[1])! {
                    guard current?.up != nil else { break }
                    
                    current = current?.up
                }
            } else {
                for _ in 1...Int(input[1])! {
                    guard current?.down != nil else { break }
                    
                    current = current?.down
                }
            }
        }
    }
    
    current = head
    
    var result = Set<Int>()
    
    while current != nil {
        result.insert(current!.value)
        current = current?.down
    }
    
    return stride(from: 0, to: n, by: 1).map { result.contains($0) ? "O" : "X" }.joined()
}
