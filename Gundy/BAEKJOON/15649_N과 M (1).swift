let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = (1...input[0]).map(String.init)
var used = Array(repeating: false, count: input[0])
var stack = [String]()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    for index in 0...input[0] - 1 {
        guard used[index] == false else { continue }
        
        used[index] = true
        stack.append(numbers[index])
        backtracking()
        stack.removeLast()
        used[index] = false
    }
}

backtracking()
print(result)
