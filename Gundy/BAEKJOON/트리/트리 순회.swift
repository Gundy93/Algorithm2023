let number = Int(readLine()!)!
var links = [String: (String?, String?)]()
for _ in 1...number {
    let nodes = readLine()!.split(separator: " ").map(String.init)
    links[nodes[0], default: (nil, nil)].0 = nodes[1] == "." ? nil: nodes[1]
    links[nodes[0], default: (nil, nil)].1 = nodes[2] == "." ? nil: nodes[2]
}

func preorder(_ node: String) -> String {
    var result = String()
    result += node
    let childs = links[node]!
    if let left = childs.0 {
        result += preorder(left)
    }
    if let right = childs.1 {
        result += preorder(right)
    }
    return result
}

func inorder(_ node: String) -> String {
    var result = String()
    let childs = links[node]!
    if let left = childs.0 {
        result += inorder(left)
    }
    result += node
    if let right = childs.1 {
        result += inorder(right)
    }
    return result
}

func postorder(_ node: String) -> String {
    var result = String()
    let childs = links[node]!
    if let left = childs.0 {
        result += postorder(left)
    }
    if let right = childs.1 {
        result += postorder(right)
    }
    result += node
    return result
}

print(preorder("A"))
print(inorder("A"))
print(postorder("A"))
