let numberOfComputers = Int(readLine()!)!
let numberOfLinks = Int(readLine()!)!
var links = [Int: Set<Int>]()

for _ in stride(from: 1, through: numberOfLinks, by: 1) {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].insert(link[1])
    links[link[1], default: []].insert(link[0])
}

var visited = Set([1])
var stack = [1]

while let current = stack.popLast() {
    for computer in links[current, default: []] {
        guard visited.contains(computer) == false else { continue }
        
        visited.insert(computer)
        stack.append(computer)
    }
}

print(visited.count - 1)
