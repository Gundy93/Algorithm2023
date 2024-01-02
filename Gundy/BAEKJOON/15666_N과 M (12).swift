let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = Set(readLine()!.split(separator: " ").map(String.init)).sorted { Int($0)! < Int($1)! }
let maxIndex = numbers.count - 1
var stack = [String]()
var indices = [Int]()
var result = String()

func backtracking() {
    guard stack.count < input[1] else {
        result += stack.joined(separator: " ") + "\n"
        
        return
    }
    
    let last = indices.last ?? 0
    
    for index in last...maxIndex {
        indices.append(index)
        stack.append(numbers[index])
        backtracking()
        stack.removeLast()
        indices.removeLast()
    }
}

backtracking()
print(result)
