func solution() {
    let count = Int(readLine()!)!
    var links = [[Int]]()
    
    for start in 0..<count-1 {
        let costs = readLine()!.split(separator: " ").map { Int($0)! }
        
        for end in start+1..<count {
            links.append([start, end, costs[end]])
        }
    }
    
    links.sort { $0[2] < $1[2] }
    
    var roots = Array(0..<count)
    
    func root(_ node: Int) -> (Int, Int) {
        var current = node
        var root = roots[node]
        var count = 0
        
        while current != root {
            current = root
            root = roots[current]
            count += 1
        }
        
        return (root, count)
    }
    
    var result = 0
    
    for link in links {
        let left = root(link[0])
        let right = root(link[1])
        
        guard left.0 != right.0 else { continue }
        
        if left.1 < right.1 {
            roots[left.0] = right.0
        } else {
            roots[right.0] = left.0
        }
        
        result += link[2]
    }
    
    print(result)
}

solution()
