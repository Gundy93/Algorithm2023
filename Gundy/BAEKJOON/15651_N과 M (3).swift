let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [String]()
var result = String()

func backtracking() {
    guard numbers.count < input[1] else {
        result += numbers.joined(separator: " ") + "\n"
        
        return
    }
    
    for number in 1...input[0] {
        numbers.append(String(number))
        backtracking()
        numbers.removeLast()
    }
}

backtracking()
print(result)
