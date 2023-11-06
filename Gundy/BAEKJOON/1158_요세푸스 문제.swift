class Node {
    
    let value: String
    var next: Node?
    
    init(_ value: String) {
        self.value = value
    }
}

struct List {
    
    var first: Node?
    var last: Node?
    var isEmpty: Bool {
        return first == nil
    }
    
    mutating func append(_ value: String) {
        guard first != nil else {
            first = Node(value)
            last = first
            return
        }
        last?.next = Node(value)
        last = last?.next
    }
    
    mutating func configureCycle() {
        last?.next = first
    }
    
    mutating func remove(at index: Int) -> String {
        if index > 1 {
            for _ in 1...index-1 {
                first = first?.next
                last = last?.next
            }
        }
        return removeFirst()
    }
    
    mutating func removeFirst() -> String {
        let value: String = first!.value
        first = first?.next
        last?.next = first
        return value
    }
}

func solution() {
    let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
    var numbers: List = List()
    for number in 1...input[0] {
        numbers.append(String(number))
    }
    numbers.configureCycle()
    var result: [String] = []
    for _ in 1...input[0] {
        result.append(numbers.remove(at: input[1]))
    }
    print("<", result.joined(separator: ", "), ">", separator: "")
}

solution()
