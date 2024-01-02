let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = (1...input[0]).map(String.init)
var stack = [String]()
var indices = [Int]()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    let last = indices.last ?? -1
    
    for index in stride(from: last + 1, to: input[0], by: 1) {
        indices.append(index)
        stack.append(numbers[index])
        backtracking()
        stack.removeLast()
        indices.removeLast()
    }
}

backtracking()
print(result)
