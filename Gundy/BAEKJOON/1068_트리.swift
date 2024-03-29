func solution() {
    let count = Int(readLine()!)!
    let parents = readLine()!.split(separator: " ").map { Int($0)! }
    let willRemove = Int(readLine()!)!
    let root = parents.firstIndex(of: -1)!
    
    guard root != willRemove else {
        print(0)
        return
    }
    
    var children = Array(
        repeating: Set<Int>(),
        count: count
    )
    
    for node in 0..<count where node != root {
        children[parents[node]].insert(node)
    }
    
    var nodes = [willRemove]
    
    while let node = nodes.popLast() {
        children[parents[node]].remove(node)
        nodes += Array(children[node])
    }
    
    var result = 0
    var needVisit = [root]
    
    while let node = needVisit.popLast() {
        if children[node].isEmpty {
            result += 1
        } else {
            needVisit += Array(children[node])
        }
    }
    
    print(result)
}

solution()
