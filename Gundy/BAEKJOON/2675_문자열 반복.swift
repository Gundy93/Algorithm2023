let countOfCases = Int(readLine()!)!

stride(from: 1, through: countOfCases, by: 1).forEach { _ in
    let input = readLine()!.split(separator: " ").map(String.init)
    let count = Int(input[0])!
    
    print(input[1].map { String(repeating: String($0), count: count) }.joined())
}
