let countOfCases = Int(readLine()!)!

stride(from: 1, through: countOfCases, by: 1).forEach { _ in
    let text = readLine()!
    
    print(text.first!, text.last!, separator: "")
}
