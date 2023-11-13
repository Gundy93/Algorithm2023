let countOfCases = Int(readLine()!)!

for _ in 1...countOfCases {
    var number = Int(readLine()!)!
    var result = [String]()
    
    for divisor in [25, 10, 5, 1] {
        result.append(String(number / divisor))
        number %= divisor
    }
    
    print(result.joined(separator: " "))
}
