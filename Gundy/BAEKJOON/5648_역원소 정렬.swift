var numbers = readLine()!.split(separator: " ").map(String.init)
let count = Int(numbers[0])!

numbers.removeFirst()

while numbers.count < count {
    numbers += readLine()!.split(separator: " ").map(String.init)
}

let result: [Int] = numbers.map { number in
    var number = number
        
        while number.last == "0" {
            number.removeLast()
        }
        
        return Int(String(number.reversed()))!
}

print(result.sorted().map(String.init).joined(separator: "\n"))
