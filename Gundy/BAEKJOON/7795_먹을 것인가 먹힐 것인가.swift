let n = Int(readLine()!)!
var result = ""

for _ in 1...n {
    _ = readLine()
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    let target = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
    var index = 0
    var count = 0
    
    for number in numbers {
        while index < target.count,
              target[index] < number {
            index += 1
        }
        count += index
    }
    
    result += "\(count)\n"
}

print(result)
