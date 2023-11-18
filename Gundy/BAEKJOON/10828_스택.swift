let numberOfCommands = Int(readLine()!)!
var stack = [String]()

for _ in 1...numberOfCommands {
    let command = readLine()!.split(separator: " ").map(String.init)
    
    switch command[0] {
    case "push":
        stack.append(command[1])
    case "pop":
        print(stack.popLast() ?? -1)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    default:
        print(stack.last ?? -1)
    }
}
