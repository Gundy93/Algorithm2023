_ = readLine()
let count = Int(readLine()!)!
var links = [Int : [Int]]()

for _ in 0..<count {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    links[link[0], default: []].append(link[1])
    links[link[1], default: []].append(link[0])
}

var visited = Set<Int>()
var computers = [1]

while let computer = computers.popLast() {
    guard visited.contains(computer) == false else { continue }
    
    visited.insert(computer)
    computers += links[computer, default: []]
}

print(visited.count-1)
