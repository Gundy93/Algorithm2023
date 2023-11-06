let numberOfNodes = Int(readLine()!)!
var tree = Array(repeating: Set<Int>(), count: numberOfNodes)
var root = 0
let parents = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
for index in 0...numberOfNodes - 1 {
    let node = parents[index]
    if node == -1 {
        root = index
    } else {
        tree[node].insert(index)
    }
}
let target = Int(readLine()!)!
for index in 0...numberOfNodes - 1 {
    if tree[index].contains(target) {
        tree[index].remove(target)
        break
    }
}
var result = 0
if target != root {
    var needVisit = [root]
    while needVisit.isEmpty == false {
        let node = needVisit.removeLast()
        if tree[node].isEmpty {
            result += 1
        } else {
            needVisit += Array(tree[node])
        }
    }
}
print(result)
