let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map(String.init).sorted { Int($0)! < Int($1)! }
var stack = [String]()
var used = Array(repeating: false, count: input[0])
var result = String()
var checked = Set<String>()

func backtracking() {
    guard stack.count < input[1] else {
        let current = stack.joined(separator: " ")
        
        if checked.contains(current) == false {
            checked.insert(current)
            result += current + "\n"
        }
        
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
