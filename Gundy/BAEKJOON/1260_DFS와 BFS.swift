let input = readLine()!.split(separator: " ").compactMap { Int($0) }
let countOfNodes = input[0]
let countOfLinks = input[1]
let startNode = input[2]
var linking = [Int: Set<Int>]()

for _ in 1...countOfLinks {
    let link = readLine()!.split(separator: " ").compactMap { Int($0) }

    linking[link[0], default: []].insert(link[1])
    linking[link[1], default: []].insert(link[0])
}

func dfs() {
    var isVisited = Array(repeating: false, count: countOfNodes + 1)
    var needVisit = [startNode]
    var result = [Int]()

    while needVisit.isEmpty == false {
        let node = needVisit.removeLast()

        guard isVisited[node] == false else {
            continue
        }

        isVisited[node] = true
        needVisit += linking[node, default: []].sorted(by: >)
        result.append(node)
    }

    print(result.map(String.init).joined(separator: " "))
}

func bfs() {
    var isVisited = Array(repeating: false, count: countOfNodes + 1)
    var needVisit = [startNode]
    var result = [Int]()

    while needVisit.isEmpty == false {
        let node = needVisit.removeLast()

        guard isVisited[node] == false else {
            continue
        }

        isVisited[node] = true
        needVisit = linking[node, default: []].sorted(by: >) + needVisit
        result.append(node)
    }

    print(result.map(String.init).joined(separator: " "))
}

dfs()
bfs()
