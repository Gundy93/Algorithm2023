var origin: [String] = []

readLine()!.forEach { origin.append(String($0)) }

let count: Int = Int(readLine()!)!

func solution(count: Int) {
    var leftSide: [String] = origin
    var rightSide: [String] = []
    for _ in 1...count {
        let command = readLine()!
        switch command {
        case "L":
            guard leftSide.isEmpty == false else { continue }
            rightSide.append(leftSide.removeLast())
        case "D":
            guard rightSide.isEmpty == false else { continue }
            leftSide.append(rightSide.removeLast())
        case "B":
            leftSide.popLast()
        default:
            let value = String(command.last!)
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

solution(count: count)
