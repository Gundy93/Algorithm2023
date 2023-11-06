func solution() {
    let count: Int = Int(readLine()!)!
    var result: Int = 0
    var stack: [Int] = []
    for _ in 1...count {
        let value: Int = Int(readLine()!)!
        while stack.isEmpty == false {
            if stack.last! <= value {
                stack.removeLast()
                result += stack.count
            } else {
                break
            }
        }
        stack.append(value)
    }
    while stack.isEmpty == false {
        stack.removeLast()
        result += stack.count
    }
    print(result)
}

solution()
