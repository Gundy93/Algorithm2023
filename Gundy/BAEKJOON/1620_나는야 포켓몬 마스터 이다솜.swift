let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = [String: Int]()
var names = [Int: String]()

for number in 1...input[0] {
    let name = readLine()!
    
    numbers[name] = number
    names[number] = name
}

var result = String()

for _ in 1...input[1] {
    let input = readLine()!
    
    if let number = Int(input) {
        result += names[number]! + "\n"
    } else {
        result += String(numbers[input]!) + "\n"
    }
}

print(result)
