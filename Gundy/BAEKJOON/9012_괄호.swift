func validatePS(_ text: String) -> Bool {
    var stack = [Character]()
    
    for word in text {
        switch word {
        case ")":
            guard stack.last == "(" else { return false }
            
            stack.removeLast()
        default:
            stack.append(word)
        }
    }
    
    return stack.isEmpty
}

let count = Int(readLine()!)!
var result = String()

for _ in 1...count {
    result += validatePS(readLine()!) ? "YES\n" : "NO\n"
}

print(result)
