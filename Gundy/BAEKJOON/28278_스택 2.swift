let numberOfCommands = Int(readLine()!)!
var stack = [String]()

for _ in 1...numberOfCommands {
    let command = readLine()!.split(separator: " ").map(String.init)
    
    switch command[0] {
    case "1":
        stack.append(command[1])
    case "2":
        print(stack.popLast() ?? -1)
    case "3":
        print(stack.count)
    case "4":
        print(stack.isEmpty ? 1 : 0)
    default:
        print(stack.last ?? -1)
    }
}
