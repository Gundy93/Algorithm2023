var result = String()

func recursion(_ numbers: [Int], _ count: Int, _ maximum: Int) {
    guard numbers.count < count else {
        result += numbers.map(String.init).joined(separator: " ") + "\n"
        
        return
    }
    
    let existing = Set(numbers)
    
    for number in 1...maximum {
        guard existing.contains(number) == false else { continue }
        
        recursion(numbers + [number], count, maximum)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

recursion([], input[1], input[0])

print(result)
