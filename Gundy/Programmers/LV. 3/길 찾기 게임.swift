import Foundation

class Node {
    let number: Int
    var left: Node?
    var right: Node?
    
    init(_ number: Int) {
        self.number = number
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var nodes = [(Int, Int, Int)]()
    
    for (number, node) in nodeinfo.enumerated() {
        nodes.append((node[0], node[1], number+1))
    }
    
    func findRoot(_ nodes: [(Int, Int, Int)]) -> Node? {
        guard nodes.isEmpty == false else { return nil }
        
        var maxIndex = -1
        var maximumY = -1
        
        for index in 0..<nodes.count {
            if nodes[index].1 > maximumY {
                maxIndex = index
                maximumY = nodes[index].1
            }
        }
        
        let root = Node(nodes[maxIndex].2)
        
        root.left = findRoot(Array(nodes[0..<maxIndex]))
        root.right = findRoot(Array(nodes[maxIndex+1..<nodes.count]))
        
        return root
    }
    
    let root = findRoot(nodes.sorted { $0.0 < $1.0 })
    
    func preorder(_ node: Node?) -> [Int] {
        guard node != nil else { return [] }
        
        return [node!.number] + preorder(node?.left) + preorder(node?.right)
    }
    
    func postorder(_ node: Node?) -> [Int] {
        guard node != nil else { return [] }
        
        return postorder(node?.left) + postorder(node?.right) + [node!.number]
    }
    
    return [preorder(root), postorder(root)]
}
