let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = Set(readLine()!.split(separator: " ").map(String.init)).sorted { Int($0)! < Int($1)! }
let maxIndex = numbers.count - 1
var stack = [String]()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    for index in 0...maxIndex {
        stack.append(numbers[index])
        backtracking()
        stack.removeLast()
    }
}

backtracking()
print(result)
