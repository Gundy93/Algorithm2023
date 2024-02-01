struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var first: T? {
        return output.last ?? input.first
    }
    var last: T? {
        return input.last ?? output.first
    }
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
var needVisit = Queue<(Int, Int)>()
var previousLog = Array(repeating: -1, count: 100001)

needVisit.enqueue((input[0], -2))

while let (current, previous) = needVisit.dequeue() {
    guard 0...100000 ~= current,
          previousLog[current] == -1 else { continue }
    
    previousLog[current] = previous
    
    guard current != input[1] else { break }
    
    needVisit.enqueue((current - 1, current))
    
    if input[1] > current {
        needVisit.enqueue((current + 1, current))
        needVisit.enqueue((current * 2, current))
    }
}

var result = [input[1]]

while let last = result.last,
      previousLog[last] != -2 {
    result.append(previousLog[last])
}

print(result.count - 1, result.reversed().map(String.init).joined(separator: " "), separator: "\n")
