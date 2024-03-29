func solution() {
    let numberOfNodes = Int(readLine()!)!
    var nodes = Array(
        repeating: (-1, -1),
        count: numberOfNodes+1
    )
    
    for _ in 0..<numberOfNodes {
        let node = readLine()!.split(separator: " ").map { Int($0)! }
        
        nodes[node[0]] = (node[1], node[2])
    }
    
    var result = -1
    
    func similarInorder(_ node: Int, isLeft: Bool) {
        if nodes[node].0 != -1 {
            similarInorder(nodes[node].0, isLeft: true)
        }
        
        if nodes[node].1 != -1 {
            similarInorder(nodes[node].1, isLeft: isLeft)
        }
        
        result += isLeft ? 2 : 1
    }
    
    similarInorder(
        1,
        isLeft: false
    )
    
    print(result)
}

solution()
