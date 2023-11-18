let count = Int(readLine()!)!
var numbers = [Int]()

for _ in 1...count {
    numbers.append(Int(readLine()!)!)
}

for number in numbers.sorted() {
    print(number)
}
