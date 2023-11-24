func recursion(_ number: Int) -> Int {
    guard number > 1 else { return number }
    
    return recursion(number - 1) + recursion(number - 2)
}

print(recursion(Int(readLine()!)!))
