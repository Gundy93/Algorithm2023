struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }
    
    init(_ elements: [T] = []) {
        input = elements
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            guard input.isEmpty == false else { return nil }
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    guard words.contains(target) else { return 0 }
    var queue = Queue([(begin, 0)])
    var result = 0
    while queue.isEmpty == false {
        let now = queue.dequeue()!
        guard now.0 != target else {
            result = now.1
            break
        }
        for word in words {
            guard now.0 != word, isSimilar(now.0, word) else { continue }
            queue.enqueue((word, now.1 + 1))
        }
    }
    return result
}

func isSimilar(_ word: String, _ target: String) -> Bool {
    let word = word.map(String.init)
    let target = target.map(String.init)
    var count = 0
    for index in 0...word.count - 1 {
        if word[index] == target[index] {
            count += 1
        }
    }
    return count == word.count - 1
}
