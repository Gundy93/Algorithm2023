struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }

    init(_ elements: [T]) {
        input = elements
    }

    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    mutating func dequeue() -> T? {
        if output.isEmpty {
            guard input.isEmpty == false else {
                return nil
            }
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func solution(_ name:String) -> Int {
    var wordToIndex = [String: Int]()
    for word in ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"] {
        wordToIndex[word] = wordToIndex.count
    }
    let name = name.map(String.init)
    let count = name.filter { $0 == "A" }.count
    guard count < name.count else {
        return 0
    }
    var result = 0
    var needVisit = Queue([(name, [0, 0, count])])
    var visited = [[String]: Set<[Int]>]()
    while needVisit.isEmpty == false {
        let current = needVisit.dequeue()!
        var words = current.0
        guard visited[words, default: []].contains(current.1) == false else { continue }
        visited[words, default: []].insert(current.1)
        guard current.1[2] < words.count else {
            result = current.1[1] - 1
            break
        }
        var index = current.1[0]
        if index < 0 {
            index += words.count
        } else if index >= words.count {
            index -= words.count
        }
        guard words[index] != "A" else {
            needVisit.enqueue((words, [index + 1, current.1[1] + 1, current.1[2]]))
            needVisit.enqueue((words, [index - 1, current.1[1] + 1, current.1[2]]))
            continue
        }
        let number = wordToIndex[words[index]]! >= 13 ? 26 - wordToIndex[words[index]]! : wordToIndex[words[index]]!
        words[index] = "A"
        needVisit.enqueue((words, [index + 1, current.1[1] + number + 1, current.1[2] + 1]))
        needVisit.enqueue((words, [index - 1, current.1[1] + number + 1, current.1[2] + 1]))
    }
    return result
}
