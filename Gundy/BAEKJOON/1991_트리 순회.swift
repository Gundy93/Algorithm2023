func solution() {
    let count = Int(readLine()!)!
    var childs = [String : (String, String)]()
    
    for _ in 0..<count {
        let nodes = readLine()!.split(separator: " ").map(String.init)
        
        childs[nodes[0]] = (nodes[1], nodes[2])
    }
    
    func preorder(_ node: String) -> String {
        guard node != "." else { return "" }
        
        return node + preorder(childs[node]!.0) + preorder(childs[node]!.1)
    }
    
    func inorder(_ node: String) -> String {
        guard node != "." else { return "" }
        
        return inorder(childs[node]!.0) + node + inorder(childs[node]!.1)
    }
    
    func postorder(_ node: String) -> String {
        guard node != "." else { return "" }
        
        return postorder(childs[node]!.0) + postorder(childs[node]!.1) + node
    }
    
    print(preorder("A"), inorder("A"), postorder("A"), separator: "\n")
}

solution()
