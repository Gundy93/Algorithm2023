let _ = readLine()
let numbers = Set(readLine()!.split(separator: " ").compactMap { Int(String($0)) })
let target = Int(readLine()!)!
var result = 0

for number in numbers.sorted() {
    guard Double(number) < Double(target) / 2 else { break }
    
    if numbers.contains(target - number) {
        result += 1
    }
}

print(result)
