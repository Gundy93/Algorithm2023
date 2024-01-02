let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map(String.init).sorted { Int($0)! < Int($1)! }
var stack = [String]()
var indices = [Int]()
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
