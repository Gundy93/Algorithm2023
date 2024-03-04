let count = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = Int.max

outside: for start in 0..<count-3 {
    for end in start+3..<count {
        guard result != 0 else { break outside }
        
        let snowman = numbers[start] + numbers[end]
        var left = start+1
        var right = end-1
        
    loop: while left < right {
            let sum = numbers[left] + numbers[right]
            result = min(result, abs(snowman - sum))
            
            switch sum {
            case ..<snowman:
                left += 1
            case snowman:
                break loop
            default:
                right -= 1
            }
        }
    }
}

print(result)
