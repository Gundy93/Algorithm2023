let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [String]()
var hasNumber = Set<Int>()
var result = String()

func backtracking(start: Int) {
    guard numbers.count < input[1] else {
        result += numbers.joined(separator: " ") + "\n"
        
        return
    }
    
    for number in 1...input[0] {
        guard hasNumber.contains(number) == false else { continue }
        
        numbers.append(String(number))
        hasNumber.insert(number)
        backtracking(start: number + 1)
        hasNumber.remove(number)
        numbers.removeLast()
    }
}

backtracking(start: 1)

print(result)
