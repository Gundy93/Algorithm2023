func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parents = readLine()!.split(separator: " ").map { Int($0)!-1 }
    var children = [Int : [Int]]()
    
    for person in 1..<input[0] {
        children[parents[person], default: []].append(person)
    }
    
    var result = Array(repeating: 0, count: input[0])
    
    for _ in 0..<input[1] {
        let compliment = readLine()!.split(separator: " ").map { Int($0)! }
        
        result[compliment[0]-1] += compliment[1]
    }
    
    var stack = [0]
    
    while let current = stack.popLast() {
        for next in children[current, default: []] {
            result[next] += result[current]
            stack.append(next)
        }
    }
    
    print(result.map(String.init).joined(separator: " "))
}

solution()
