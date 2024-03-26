func solution() {
    func findTrees(_ caseNumber: Int) -> String? {
        guard let input = readLine(),
              input != "0 0" else { return nil }
        
        let counts = input.split(separator: " ").map { Int($0)! }
        var links = [Int : [Int]]()
        
        for _ in 0..<counts[1] {
            let link = readLine()!.split(separator: " ").map { Int($0)! }
            
            links[link[0], default: []].append(link[1])
            links[link[1], default: []].append(link[0])
        }
        
        var visited = Set<Int>()
        var count = 0
        
        for start in 1...counts[0] {
            guard visited.contains(start) == false else { continue }
            
            var isCycle = false
            var needVisit = [(start, start)]
            
            while let (current, previous) = needVisit.popLast() {
                guard visited.contains(current) == false else { continue }
                
                visited.insert(current)
                
                for next in links[current, default: []] where next != previous {
                    guard visited.contains(next) == false else {
                        isCycle = true
                        continue
                    }
                    
                    needVisit.append((next, current))
                }
            }
            
            if isCycle == false {
                count += 1
            }
        }
        
        switch count {
        case 0:
            return "Case " + String(caseNumber) + ": No trees.\n"
        case 1:
            return "Case " + String(caseNumber) + ": There is one tree.\n"
        case let count:
            return "Case " + String(caseNumber) + ": A forest of " + String(count) + " trees.\n"
        }
    }
    
    var result = ""
    
    for caseNumber in 1... {
        if let text = findTrees(caseNumber) {
            result += text
        } else {
            break
        }
    }
    
    print(result)
}

solution()
