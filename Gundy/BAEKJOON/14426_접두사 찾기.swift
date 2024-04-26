struct Trie {
    private var tree = Array(repeating: Array(repeating: 0, count: 27), count: 500*10000+1)
    private var next = 1
    
    mutating func insert(_ newElement: String) {
        var current = 0
        
        for character in newElement {
            let index = Int(character.asciiValue! - 97)
            
            if tree[current][index] == 0 {
                tree[current][index] = next
                next += 1
            }
            
            current = tree[current][index]
        }
        
        tree[current][26] = 1
    }
    
    func contains(_ element: String) -> Bool {
        var current = 0
        
        for character in element {
            let index = Int(character.asciiValue! - 97)
            
            if tree[current][index] == 0 { return false }
            
            current = tree[current][index]
        }
        
        return true
    }
}

func solution() {
    let counts = readLine()!.split(separator: " ").map { Int($0)! }
    var trie = Trie()
    
    for _ in 0..<counts[0] {
        trie.insert(readLine()!)
    }
    
    var result = 0
    
    for _ in 0..<counts[1] {
        if trie.contains(readLine()!) { result += 1 }
    }
    
    print(result)
}

solution()
