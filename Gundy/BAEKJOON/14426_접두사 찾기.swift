func solution() {
    let counts = readLine()!.split(separator: " ").map { Int($0)! }
    var words = [String]()
    
    for _ in 0..<counts[0] {
        words.append(readLine()!)
    }
    
    words.sort()
    
    var result = 0
    
    for _ in 0..<counts[1] {
        let word = readLine()!
        var start = 0
        var end = counts[0]-1
        
        while start < end {
            let index = (start + end + 1)/2
            
            if words[index] > word {
                end = index-1
            } else {
                start = index
            }
        }
        
        if words[start].hasPrefix(word) || words[min(start+1, counts[0]-1)].hasPrefix(word) { result += 1 }
    }
    
    print(result)
}

solution()
