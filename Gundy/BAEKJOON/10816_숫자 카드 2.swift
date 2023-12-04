let _ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let _ = readLine()
let targets = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for target in targets {
    guard let firstIndex = firstIndex(target) else {
        result += "0 "
        
        continue
    }
    
    let lastIndex = lastIndex(target)!
    
    result += "\(lastIndex - firstIndex + 1) "
}

result.removeLast()

print(result)

func firstIndex(_ element: Int) -> Int? {
    var start = 0
    var end = numbers.count - 1
    
    while start < end {
        let half = (start + end) / 2
        
        if numbers[half] < element {
            start = half + 1
        } else {
            end = half
        }
    }
    
    return numbers[end] == element ? end : nil
}

func lastIndex(_ element: Int) -> Int? {
    var start = 0
    var end = numbers.count - 1
    
    while start < end {
        let half = (start + end + 1) / 2
        
        if numbers[half] <= element {
            start = half
        } else {
            end = half - 1
        }
    }
    
    return numbers[start] == element ? start : nil
}
