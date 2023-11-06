struct Stack<T> {

    private var container: [T]
    var last: T? { return container.last }
    var count: Int { return container.count }
    var isEmpty: Bool { return container.isEmpty }
    var values: [T] { return container }

    init(_ elements: [T] = []) {
        self.container = elements
    }

    mutating func push(_ newElemnet: T) {
        container.append(newElemnet)
    }

    @discardableResult mutating func pop() -> T? {
        return container.popLast()
    }
}

var stack = Stack([Int]())

for _ in 1...Int(readLine()!)! {
    let number = Int(readLine()!)!
    if number == 0 {
        stack.pop()
    } else {
        stack.push(number)
    }
}

print(stack.values.reduce(0, +))
