class Node {
    let number : Int
    let x: Int
    var left: Node?
    var right: Node?
    
    init(_ number: Int, _ x: Int) {
        self.number = number
        self.x = x
    }
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var head: Node? = nil
    func insert(_ number: Int, _ x: Int, _ node: inout Node?) {
        guard let now = node else {
            node = Node(number, x)
            return
        }
        if now.x > x {
            insert(number, x, &now.left)
        } else {
            insert(number, x, &now.right)
        }
    }
    
    func makePreorder(_ node: Node?) -> [Int] {
        guard let node = node else { return [] }
        return [node.number] + makePreorder(node.left) + makePreorder(node.right)
    }
    
    func makePostorder(_ node: Node?) -> [Int] {
        guard let node = node else { return [] }
        return makePostorder(node.left) + makePostorder(node.right) + [node.number]
    }
    nodeinfo.enumerated().sorted(by: { return $0.element[1] > $1.element[1] }).forEach { insert($0.offset + 1, $0.element[0], &head) }
    return [makePreorder(head), makePostorder(head)]
}
