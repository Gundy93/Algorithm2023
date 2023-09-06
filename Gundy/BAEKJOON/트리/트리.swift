var input = readLine()!
var numberOfCases = 1

while input != "0 0" {
    let command = input.split(separator: " ").map(String.init).compactMap(Int.init)
    var numberOfTrees = 0
    var links = [Int: [Int]]()
    for _ in stride(from: 1, through: command[1], by: 1) {
        let nodes = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)	
        links[nodes[0], default: []].append(nodes[1])
        links[nodes[1], default: []].append(nodes[0])
    }
    var visited = Set<Int>()
    for node in 1...command[0] {
        guard visited.contains(node) == false else { continue }
        var isValid = true
        var needVisit: [(Int, Int?)] = [(node, nil)]
        while needVisit.isEmpty == false {
            let now = needVisit.removeLast()
            guard visited.contains(now.0) == false else { continue }
            visited.insert(now.0)
            if let nodes = links[now.0] {
                for node in nodes {
                    guard node != now.1 else { continue }
                    if visited.contains(node) {
                        isValid = false
                    }
                    needVisit.append((node, now.0))
                }
            }
        }
        if isValid {
            numberOfTrees += 1
        }
    }
    switch numberOfTrees {
    case 0:
        print("Case \(numberOfCases): No trees.")
    case 1:
        print("Case \(numberOfCases): There is one tree.")
    default:
        print("Case \(numberOfCases): A forest of \(numberOfTrees) trees.")
    }
    numberOfCases += 1
    input = readLine()!
}
