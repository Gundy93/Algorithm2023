var result = String()

func recursion(_ numbers: [Int], _ count: Int, _ maximum: Int) {
    guard numbers.count < count else {
        result += numbers.map(String.init).joined(separator: " ") + "\n"
        
        return
    }
    
    var start = 1
    
    if let last = numbers.last {
        start = last
    }
    
    for number in stride(from: start, through: maximum, by: 1) {
        recursion(numbers + [number], count, maximum)
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }

recursion([], input[1], input[0])

print(result)
