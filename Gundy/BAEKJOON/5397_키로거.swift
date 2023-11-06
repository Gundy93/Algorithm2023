func solution() {
    var leftSide: [String] = []
    var rightSide: [String] = []
    let input = readLine()!
    for text in input {
        switch text {
        case "<":
            guard leftSide.isEmpty == false else { continue }
            rightSide.append(leftSide.removeLast())
        case ">":
            guard rightSide.isEmpty == false else { continue }
            leftSide.append(rightSide.removeLast())
        case "-":
            leftSide.popLast()
        default:
            let value = String(text)
            leftSide.append(value)
        }
    }

    var result: String = ""

    for index in 0..<leftSide.count {
        result += leftSide[index]
    }

    for _ in 0..<rightSide.count {
        result += rightSide.removeLast()
    }

    print(result)
}

let count: Int = Int(readLine()!)!

for _ in 1...count {
    solution()
}
