let numberOfInputs = Int(readLine()!)!
let numbers: [Int] = {
    var numbers = [Int]()

    for _ in 1...numberOfInputs {
        numbers.append(Int(readLine()!)!)
    }

    return numbers
}()

for number in numbers.sorted() {
    print(number)
}
