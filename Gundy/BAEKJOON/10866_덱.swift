struct Deque<T> {
    private var leading: [T] = []
    private var trailing: [T] = []
    
    var head: T? {
        return leading.isEmpty ? trailing.first : leading.last
    }
    var tail: T? {
        return trailing.isEmpty ? leading.first : trailing.last
    }
    var count: Int {
        return leading.count + trailing.count
    }
    var isEmpty: Bool {
        return leading.isEmpty && trailing.isEmpty
    }
    
    mutating func insertAtHead(_ element: T) {
        leading.append(element)
    }
    
    mutating func insertAtTail(_ element: T) {
        trailing.append(element)
    }
    
    @discardableResult mutating func popFirst() -> T? {
        if leading.isEmpty {
            leading = trailing.reversed()
            trailing = []
        }
        return leading.popLast()
    }
    
    @discardableResult mutating func popLast() -> T? {
        if trailing.isEmpty {
            trailing = leading.reversed()
            leading = []
        }
        return trailing.popLast()
    }
}

func solution() {
    var deque = Deque<String>()
    var count: Int = Int(readLine()!)!
    for _ in 1...count {
        let command: String = readLine()!
        switch command {
        case "front":
            print(deque.head ?? "-1")
        case "back":
            print(deque.tail ?? "-1")
        case "size":
            print(deque.count)
        case "empty":
            print(deque.isEmpty ? "1" : "0")
        default:
            let input = command.split(separator: " ")
            switch input[0] {
            case "push_front":
                deque.insertAtHead(String(input[1]))
            case "push_back":
                deque.insertAtTail(String(input[1]))
            case "pop_front":
                print(deque.popFirst() ?? "-1")
            default:
                print(deque.popLast() ?? "-1")
            }
        }
    }
}

solution()
