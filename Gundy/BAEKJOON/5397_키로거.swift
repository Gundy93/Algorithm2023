let countOfCases = Int(readLine()!)!

for _ in 1...countOfCases {
    var left = [String]()
    var right = [String]()
    
    readLine()!.map(String.init).forEach { word in
        switch word {
        case "-":
            let _ = left.popLast()
        case "<":
            guard let last = left.popLast() else { return }
            
            right.append(last)
        case ">":
            guard let last = right.popLast() else { return }
            
            left.append(last)
        default:
            left.append(word)
        }
    }
    
    print(left.joined() + right.reversed().joined())
}
