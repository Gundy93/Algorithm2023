func solution() {
    let count = Int(readLine()!)!
    var isRoot = Set(1...count)
    var children = Array(repeating: [Int](), count: count+1)
    
    for _ in 0..<count {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        
        isRoot.remove(input[1])
        isRoot.remove(input[2])
        children[input[0]] = [input[1], input[2]]
    }
    
    let root = isRoot.first!
    var nodes = [(Int, Int)]()
    
    func recursion(_  node: Int, _ level: Int) {
        if children[node][0] != -1 {
            recursion(children[node][0], level+1)
        }
        
        nodes.append((node, level))
        
        if children[node][1] != -1 {
            recursion(children[node][1], level+1)
        }
    }
    
    recursion(root, 1)
    
    var levels = [Int : (Int, Int)]()
    
    for (index, node) in nodes.enumerated() {
        if let (start, end) = levels[node.1] {
            levels[node.1] = (start, max(end, index))
        } else {
            levels[node.1] = (index, index)
        }
    }
    
    var result = (0, 0)
    
    for level in 1... {
        guard let (min, max) = levels[level] else { break }
        
        let width = max - min + 1
        
        if result.1 < width {
            result = (level, width)
        }
    }
    
    print(result.0, result.1)
}

solution()
