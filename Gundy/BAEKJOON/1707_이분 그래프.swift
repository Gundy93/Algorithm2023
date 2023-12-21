let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var links = [Int: Set<Int>]()
    
    for _ in 1...input[1] {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        
        links[link[0], default: []].insert(link[1])
        links[link[1], default: []].insert(link[0])
    }
    
    var visited = Set<Int>()
    var left = Set<Int>()
    var right = Set<Int>()
    var isValid = true
    
loop: for node in 1...input[0] {
        guard visited.contains(node) == false else { continue }
        
        visited.insert(node)
        left.insert(node)
        
        var stack = [(node: Int, isLeft: Bool)]()
        
        stack.append((node, true))
        
        while let (node, isLeft) = stack.popLast() {
            for next in links[node, default: []] {
                guard (isLeft ? left : right).contains(next) == false else {
                    isValid = false
                    
                    break loop
                }
                
                guard visited.contains(next) == false else { continue }
                
                visited.insert(next)
                stack.append((next, !isLeft))
                
                if isLeft {
                    right.insert(next)
                } else {
                    left.insert(next)
                }
            }
        }
    }
    
    result += isValid ? "YES\n" : "NO\n"
}

print(result)
