func isFrime(_ number: Int) -> Bool {
    guard number > 3 else { return number != 1 }
    
    for divisor in 2... {
        if number % divisor == 0 {
            return false
        }
        
        guard divisor * divisor < number else { break }
    }
    
    return true
}

let range = readLine()!.split(separator: " ").map { Int($0)! }

print((range[0]...range[1]).filter(isFrime).map(String.init).joined(separator: "\n"))
