class Node {
    var up: Node?
    var down: Node?
    let index: Int

    init(up: Node? = nil, down: Node? = nil, index: Int) {
        self.up = up
        self.down = down
        self.index = index
    }
}

func solution(_ n:Int, _ k:Int, _ cmd:[String]) -> String {
    var result = Array(repeating: "O", count: n)
    var nodes = [Node(index: 0)]
    for i in stride(from: 1, to: n, by: 1) {
        nodes.append(Node(index: i))
        nodes[nodes.count - 1].up = nodes[nodes.count - 2]
        nodes[nodes.count - 2].down = nodes[nodes.count - 1]
    }
    var now = nodes[k]
    var removed = [Node]()
    for command in cmd {
        let order = command.split(separator: " ").map(String.init)
        switch order.first {
        case "U":
            let times = Int(order[1])!
            for _ in 1...times {
                now = now.up!
            }
        case "D":
            let times = Int(order[1])!
            for _ in 1...times {
                now = now.down!
            }
        case "C":
            result[now.index] = "X"
            removed.append(now)
            now.up?.down = now.down
            now.down?.up = now.up
            if now.down == nil {
                now = now.up!
            } else {
                now = now.down!
            }
        default:
            let last = removed.removeLast()
            result[last.index] = "O"
            last.up?.down = last
            last.down?.up = last
        }
    }
    return result.joined()
}
