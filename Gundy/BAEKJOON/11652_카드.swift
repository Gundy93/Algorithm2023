var numbers = [Int: Int]()
let numberOfNumbers = Int(readLine()!)!

for _ in 1...numberOfNumbers {
    let number = Int(readLine()!)!
    numbers[number, default: 0] += 1
}

let result = numbers.map({ (number: $0.key, count: $0.value) }).sorted {
    if $0.count == $1.count {
        return $0.number < $1.number
    }
    return $0.count > $1.count
}[0].number

print(result)
