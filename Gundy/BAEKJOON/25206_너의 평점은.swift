var totalPoint = Double.zero
var totalCount = Double.zero

stride(from: 1, through: 20, by: 1).forEach { _ in
    let input = readLine()!.split(separator: " ").map(String.init)
    
    guard input.last != "P" else { return }
    
    let count = Double(input[1])!
    
    totalCount += count
    
    switch input.last {
    case "A+":
        totalPoint += count * 4.5
    case "A0":
        totalPoint += count * 4
    case "B+":
        totalPoint += count * 3.5
    case "B0":
        totalPoint += count * 3
    case "C+":
        totalPoint += count * 2.5
    case "C0":
        totalPoint += count * 2
    case "D+":
        totalPoint += count * 1.5
    case "D0":
        totalPoint += count * 1
    default:
        return
    }
}

print(totalPoint / totalCount)
