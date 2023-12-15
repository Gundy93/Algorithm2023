let input = readLine()!.map(String.init)
let bomb = readLine()!
let last = String(bomb.last!)
var stack = [String]()

for word in input {
    stack.append(word)
    
    guard word == last,
          stack.count >= bomb.count else { continue }
    
    if stack[stack.count - bomb.count...stack.count - 1].joined() == bomb {
        stack.removeLast(bomb.count)
    }
}

print(stack.isEmpty ? "FRULA" : stack.joined())
