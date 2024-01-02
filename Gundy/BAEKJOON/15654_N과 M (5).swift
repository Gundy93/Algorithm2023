let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var stack = [String]()
var hasNumbers = Set<Int>()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    for number in numbers {
        guard hasNumbers.contains(number) == false else { continue }
        
        stack.append(String(number))
        hasNumbers.insert(number)
        backtracking()
        hasNumbers.remove(number)
        stack.removeLast()
    }
}

backtracking()
print(result)
