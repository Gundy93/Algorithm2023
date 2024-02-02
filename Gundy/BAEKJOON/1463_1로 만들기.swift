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

let target = Int(readLine()!)!
var visited = Set<Int>()
var queue = Queue<(Int, Int)>()

queue.enqueue((target, 0))

while let (number, count) = queue.dequeue() {
    guard number > 1 else {
        print(count)
        break
    }

    if number % 3 == 0,
       visited.contains(number/3) == false {
        visited.insert(number/3)
        queue.enqueue((number/3, count+1))
    }

    if number % 2 == 0,
       visited.contains(number/2) == false {
        visited.insert(number/2)
        queue.enqueue((number/2, count+1))
    }

    if visited.contains(number-1) == false {
        visited.insert(number-1)
        queue.enqueue((number-1, count+1))
    }
}
