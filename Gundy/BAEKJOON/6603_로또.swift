var result = String()

while let input = readLine(),
      input != "0" {
    let numbers = input.split(separator: " ").map(String.init)
    let maxIndex = Int(numbers[0])!
    var stack = [String]()
    var indices = [Int]()
    
    func backtracking() {
        guard stack.count < 6 else {
            result += stack.joined(separator: " ") + "\n"
            
            return
        }
        
        let last = indices.last ?? 0
        
        for index in stride(from: last + 1, through: maxIndex, by: 1) {
            indices.append(index)
            stack.append(numbers[index])
            backtracking()
            stack.removeLast()
            indices.removeLast()
        }
    }
    
    backtracking()
    result += "\n"
}

print(result)
