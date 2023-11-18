let input = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

func recursion(_ numbers: [Int]) {
    guard numbers.count < input[1] else {
        result += numbers.map(String.init).joined(separator: " ") + "\n"
        
        return
    }
    
    for number in 1...input[0] {
        guard numbers.contains(number) == false else { continue }
        
        recursion(numbers + [number])
    }
}

recursion([])

print(result)
