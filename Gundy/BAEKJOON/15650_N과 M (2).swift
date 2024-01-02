let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [Int]()
var result = String()

func backtracking() {
    guard numbers.count < input[1] else {
        result += numbers.map(String.init).joined(separator: " ") + "\n"
        
        return
    }
    
    let last = numbers.last ?? 0
    
    for number in stride(from: last + 1, through: input[0], by: 1) {
        numbers.append(number)
        backtracking()
        numbers.removeLast()
    }
}

backtracking()
print(result)
