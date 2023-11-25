let _ = readLine()
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var operators = readLine()!.split(separator: " ").map { Int($0)! }
var maximum = Int.min
var minimum = Int.max

func backTracking(_ index: Int) {
    guard index < numbers.count else {
        maximum = max(maximum, numbers.last!)
        minimum = min(minimum, numbers.last!)
        
        return
    }
    
    for operatorIndex in 0...3 {
        guard operators[operatorIndex] > 0 else { continue }
        
        operators[operatorIndex] -= 1
        
        let origin = numbers[index]
        
        switch operatorIndex {
        case 0:
            numbers[index] += numbers[index - 1]
            backTracking(index + 1)
            numbers[index] = origin
        case 1:
            numbers[index] = numbers[index - 1] - origin
            backTracking(index + 1)
            numbers[index] = origin
        case 2:
            numbers[index] *= numbers[index - 1]
            backTracking(index + 1)
            numbers[index] = origin
        default:
            numbers[index] = numbers[index - 1] / numbers[index]
            backTracking(index + 1)
            numbers[index] = origin
        }
        
        operators[operatorIndex] += 1
    }
}

backTracking(1)

print("\(maximum)\n\(minimum)")
