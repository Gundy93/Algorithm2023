func validate(_ text: String) -> Bool {
    var stack = [Character]()
    
    for word in text {
        switch word {
        case "(", "[":
            stack.append(word)
        case ")":
            guard stack.last == "(" else { return false }
            
            stack.removeLast()
        case "]":
            guard stack.last == "[" else { return false }
            
            stack.removeLast()
        default:
            continue
        }
    }
    
    return stack.isEmpty
}

var result = String()

while let text = readLine(),
      text != "." {
    result += validate(text) ? "yes\n" : "no\n"
}

print(result)
