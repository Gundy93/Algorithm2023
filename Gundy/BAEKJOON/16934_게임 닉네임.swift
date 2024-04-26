func solution() {
    var count = [String : Int]()
    var tree = Array(repeating: [String : Int](), count: 1000001)
    var next = 1
    
    func insert(_ newElement: String) {
        var current = 0
        var nickname = ""
        var isValid = false
        
        count[newElement, default: 0] += 1
        
        for word in newElement.map(String.init) {
            if isValid == false { nickname += word }
            
            if tree[current][word] == nil {
                isValid = true
                tree[current][word] = next
                next += 1
            }
            
            current = tree[current][word]!
        }
        
        if isValid == false,
           let count = count[newElement] {
            nickname += count > 1 ? String(count) : ""
        }
        
        print(nickname)
    }
    
    for _ in 0..<Int(readLine()!)! {
        insert(readLine()!)
    }
}

solution()
