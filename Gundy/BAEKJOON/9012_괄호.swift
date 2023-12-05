func isVPS(_ text: String) -> Bool {
    var stack = [Character]()
    
    for word in text {
        if word == ")" {
            guard stack.last == "(" else { return false }
            
            stack.removeLast()
        } else {
            stack.append(word)
        }
    }
    
    return stack.isEmpty
}

let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    result += isVPS(readLine()!) ? "YES\n" : "NO\n"
}

print(result)
