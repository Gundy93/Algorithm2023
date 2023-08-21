class Node {
    let number: Int
    var left: Node?
    var right: Node?

    init(_ number: Int) {
        self.number = number
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var node = Node(0)
    var nodes = [node]
    for number in stride(from: 1, to: n, by: 1) {
        let next = Node(number)
        nodes.append(next)
        node.right = next
        next.left = node
        node = next
    }
    node = nodes[k]
    var removed = [Node]()
    var board = Array(repeating: "O", count: n)
    for command in cmd {
        let key = command.split(separator: " ").map(String.init)
        switch key[0] {
        case "C":
            removed.append(node)
            board[node.number] = "X"
            node.left?.right = node.right
            if let right = node.right {
                right.left = node.left
                node = right
            } else {
                node = node.left!
            }
        case "Z":
            let last = removed.removeLast()
            board[last.number] = "O"
            last.left?.right = last
            last.right?.left = last
        case "U":
            var number = Int(key[1])!
            while number > 0 {
                node = node.left!
                number -= 1
            }
        default:
            var number = Int(key[1])!
            while number > 0 {
                node = node.right!
                number -= 1
            }
        }
    }
    return board.joined()
}
