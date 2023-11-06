func solution() {
    let count: Int = Int(readLine()!)!
    let numbers: [Int] = readLine()!.split(separator: " ").map{ Int($0)! }
    var stack: [(Int, Int)] = [(0, numbers[0])]
    var result: [String] = .init(repeating: "-1", count: count)
    
    for index in 1..<count {
        if stack.isEmpty {
            stack.append((index, numbers[index]))
        } else {
            while stack.last!.1 < numbers[index] {
                result[stack.removeLast().0] = String(numbers[index])
                if stack.isEmpty {
                    break
                }
            }
            stack.append((index, numbers[index]))
        }
    }
    print(result.joined(separator: " "))
}

solution()
