let _ = readLine()
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let _ = readLine()
let targets = readLine()!.split(separator: " ").map { Int($0)! }
var result = String()

for target in targets {
    var start = 0
    var end = numbers.count - 1
    
    while start < end {
        let half = (start + end) / 2
        
        if numbers[half] < target {
            start = half + 1
        } else {
            end = half
        }
    }
    
    result += numbers[end] == target ? "1\n" : "0\n"
}

print(result)
