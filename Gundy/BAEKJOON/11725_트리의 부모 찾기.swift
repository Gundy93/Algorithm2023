func solution() {
    let count = Int(readLine()!)!
    var links = [Int : [Int]]()
    
    for _ in 0..<count-1 {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        
        links[link[0], default: []].append(link[1])
        links[link[1], default: []].append(link[0])
    }
    
    var parents = Array(
        repeating: 0,
        count: count+1
    )
    
    func recursion(_ parent: Int, _ node: Int) {
        parents[node] = parent
        
        for next in links[node, default: []] where next != parent {
            recursion(node, next)
        }
    }
    
    recursion(0, 1)
    print((2...count).map { String(parents[$0]) }.joined(separator: "\n"))
}

solution()
