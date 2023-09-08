let input = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
var roots = Array(stride(from: 0, through: input[0], by: 1))
var sets = roots.map({ Set([$0]) })
var links = [[Int]]()
var result = 0
func findRoot(_ index: Int) -> Int {
    var number = index
    var root = roots[number]
    while number != root {
        number = root
        root = roots[root]
    }
    return root
}
for _ in 1...input[1] {
    links.append(readLine()!.split(separator: " ").map(String.init).compactMap(Int.init))
}
links.sort(by: { $0[2] < $1[2] })
for link in links {
    let left = findRoot(link[0])
    let right = findRoot(link[1])
    guard left != right else { continue }
    if sets[left].count >= sets[right].count {
        sets[left] = sets[left].union(sets[right])
        roots[right] = left
    } else {
        sets[right] = sets[right].union(sets[left])
        roots[left] = right
    }
    result += link[2]
}
print(result)
