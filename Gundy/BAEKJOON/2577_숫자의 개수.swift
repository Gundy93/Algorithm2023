func solution() {
    let firstNumber: Int = Int(readLine()!)!
    let secondNumber: Int = Int(readLine()!)!
    let thirdNumber: Int = Int(readLine()!)!
    
    let result: [Int] = (firstNumber * secondNumber * thirdNumber).description.compactMap { Int(String($0)) }
    
    var numbers: [Int] = .init(repeating: 0, count: 10)
    result.forEach { numbers[$0] += 1 }
    
    numbers.forEach { print($0) }
}

solution()
