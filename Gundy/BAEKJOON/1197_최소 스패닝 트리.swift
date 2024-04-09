func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var roots = Array(0...input[0])
    var stack = [[Int]]()
    
    for _ in 0..<input[1] {
        stack.append(readLine()!.split(separator: " ").map { Int($0)! })
    }
    
    stack.sort { $0[2] < $1[2] }
    
    var result = 0
    
    func root(_ node: Int) -> (Int, Int) {
        var current = node
        var root = roots[node]
        var count = 0
        
        while current != root {
            count += 1
            current = root
            root = roots[root]
        }
        
        return (root, count)
    }
    
    for link in stack {
        let left = root(link[0])
        let right = root(link[1])
        
        guard left.0 != right.0 else { continue }
        
        result += link[2]
        
        if left.1 < right.1 {
            roots[left.0] = right.0
        } else {
            roots[right.0] = left.0
        }
    }
    
    print(result)
}

solution()
