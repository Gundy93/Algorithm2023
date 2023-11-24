func recursion(_ number: Int) -> Int {
    guard number > 1 else { return 1 }
    
    return number * recursion(number - 1)
}

print(recursion(Int(readLine()!)!))
