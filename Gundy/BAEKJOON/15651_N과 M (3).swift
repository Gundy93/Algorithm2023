let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = (1...input[0]).map(String.init)
var stack = [String]()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    for index in 0...input[0] - 1 {
        stack.append(numbers[index])
        backtracking()
        stack.removeLast()
    }
}

backtracking()
print(result)
