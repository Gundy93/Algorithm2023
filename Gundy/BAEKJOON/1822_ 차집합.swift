_ = readLine()
let first = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let second = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = [String]()

loop: for number in first {
    var start = 0
    var end = second.count-1
    
    while start <= end {
        let index = (start + end + 1) / 2
        
        switch second[index] {
        case ..<number:
            start = index + 1
        case number:
            continue loop
        default:
            end = index - 1
        }
    }
    
    result.append(String(number))
}

print(result.count, result.isEmpty ? "" : result.joined(separator: " "), separator: "\n")
