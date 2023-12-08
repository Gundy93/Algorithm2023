let input = readLine()!.map(String.init)
var stack = [String]()
var isValid = input.count % 2 == 0

if isValid {
    loop: for word in input {
        switch word {
        case "(", "[":
            stack.append(word)
        default:
            var inner = 0
            let target = word == ")" ? "(" : "["
            let value = word == ")" ? 2 : 3
            
            while let last = stack.last,
            last != target {
                guard let number = Int(last) else {
                    isValid = false
                    
                    break loop
                }
                
                inner += number
                stack.removeLast()
            }
            
            guard stack.last == target else {
                isValid = false
                
                break loop
            }
            
            stack.removeLast()
            stack.append(String(inner == 0 ? value : inner * value))
        }
    }
}

print(isValid ? stack.compactMap(Int.init).reduce(0, +) : 0)
