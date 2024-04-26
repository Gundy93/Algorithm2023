func solution() {
    var tree = Array(repeating: [String : Int](), count: 150001)
    var next = 1
    
    func insert(_ newElement: String) {
        let path = newElement.split(separator: " ")[1...].map(String.init)
        var current = 0
        
        for word in path {
            if tree[current][word] == nil {
                tree[current][word] = next
                next += 1
            }
            
            current = tree[current][word]!
        }
    }
    
    for _ in 0..<Int(readLine()!)! {
        insert(readLine()!)
    }
    
    var result = ""
    
    func recursion(_ dictionary: [String : Int], _ indent: String) {
        for key in dictionary.keys.sorted() {
            result += indent + key + "\n"
            
            if let next = dictionary[key] {
                recursion(tree[next], indent + "--")
            }
        }
    }
    
    recursion(tree[0], "")
    print(result)
}

solution()
