let count = Int(readLine()!)!
var result = 0

for _ in 1...count {
    let words = readLine()!
    var stack = [Character]()
    
    for word in words {
        if stack.last == word {
            stack.removeLast()
        } else {
            stack.append(word)
        }
    }
    
    if stack.isEmpty {
        result += 1
    }
}

print(result)
