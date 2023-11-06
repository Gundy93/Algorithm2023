struct Stack<T> {

    private var container: [T]
    var last: T? { return container.last }
    var count: Int { return container.count }
    var isEmpty: Bool { return container.isEmpty }

    init(_ elements: [T] = []) {
        self.container = elements
    }

    mutating func push(_ newElemnet: T) {
        container.append(newElemnet)
    }

    mutating func pop() -> T? {
        return container.popLast()
    }
}

var stack = Stack([Int]())

for _ in 1...Int(readLine()!)! {
    let command = readLine()!
    switch command {
    case "pop":
        print(stack.pop() ?? -1)
    case "size":
        print(stack.count)
    case "empty":
        print(stack.isEmpty ? 1 : 0)
    case "top":
        print(stack.last ?? -1)
    default:
        stack.push(command.split(separator: " ").compactMap({ Int($0) })[0])
    }
}
