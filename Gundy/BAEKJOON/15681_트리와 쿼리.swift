func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let count = input[0]
    let root = input[1]
    let queries = input[2]
    var links = [Int : [Int]]()
    var dp = Array(
        repeating: 0,
        count: count+1
    )
    var visited = Array(
        repeating: false,
        count: count+1
    )
    
    for _ in 1..<count {
        let link = readLine()!.split(separator: " ").map { Int($0)! }
        
        links[link[0], default: []].append(link[1])
        links[link[1], default: []].append(link[0])
    }
    
    func countFrom(_ root: Int) -> Int {
        guard visited[root] == false else { return 0 }
        
        visited[root] = true
        
        var result = 1
        
        for next in links[root, default: []] {
            result += countFrom(next)
        }
        
        dp[root] = result
        
        return result
    }
    
    dp[root] = countFrom(root)
    
    var result = ""
    
    for _ in 0..<queries {
        let query = Int(readLine()!)!
        
        result += String(dp[query]) + "\n"
    }
    
    print(result)
}

solution()
