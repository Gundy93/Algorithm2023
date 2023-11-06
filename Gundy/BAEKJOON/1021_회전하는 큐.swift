struct Deque<T: Equatable> {
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
    
    func isCloseToHead(_ element: T) -> Bool {
        let array: [T] = leading.reversed() + trailing
        guard let index = array.firstIndex(of: element) else { return false }
        return index <= (array.count / 2)
    }
}

func solution() {
    var deque = Deque<Int>()
    let input: [String] = readLine()!.split(separator: " ").map({ String($0) })
    let size: Int = Int(input[0])!
    for number in 1...size {
        deque.insertAtTail(number)
    }
    let numbers = readLine()!.split(separator: " ").compactMap({ Int(String($0))})
    var result: Int = 0
    for number in numbers {
        if number == deque.head {
            deque.popFirst()
        } else {
            if deque.isCloseToHead(number) {
                while deque.head != number {
                    result += 1
                    deque.insertAtTail(deque.popFirst()!)
                }
            } else {
                while deque.head != number {
                    result += 1
                    deque.insertAtHead(deque.popLast()!)
                }
            }
            deque.popFirst()
        }
    }
    print(result)
}

solution()
