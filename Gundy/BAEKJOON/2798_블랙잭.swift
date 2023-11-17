let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = 0

for first in 0...numbers.count - 3 {
    guard result != input[1],
          numbers[first] <  input[1] else { break }
    
    for second in first + 1...numbers.count - 2 {
        let sum = numbers[first] + numbers[second]
        
        guard sum < input[1] else { break }
        
        for third in second + 1...numbers.count - 1 {
            let total = sum + numbers[third]
            
            guard total <= input[1] else { break }
            
            result = max(result, total)
        }
    }
}

print(result)
