func solution() {
    var result = ""
    
    for _ in 0..<Int(readLine()!)! {
        let count = Int(readLine()!)!
        var numbers = [String]()
        
        for _ in 0..<count {
            numbers.append(readLine()!)
        }
        
        numbers.sort()
        
        var isValid = true
        
        for index in 0..<count-1 {
            if numbers[index+1].hasPrefix(numbers[index]) {
                isValid = false
                break
            }
        }
        
        result += (isValid ? "YES" : "NO") + "\n"
    }
    
    print(result)
}

solution()
