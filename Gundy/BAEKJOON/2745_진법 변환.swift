let numberTable = ["A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15, "G": 16, "H": 17, "I": 18, "J": 19, "K": 20, "L": 21, "M": 22, "N": 23, "O": 24, "P": 25, "Q": 26, "R": 27, "S": 28, "T": 29, "U": 30, "V": 31, "W": 32, "X": 33, "Y": 34, "Z": 35]
let input = readLine()!.split(separator: " ").map(String.init)
let numbers = input[0].map(String.init)
var count = 0
var result = 0

for number in numbers.reversed() {
    if count == 0 {
        count += 1
    } else {
        count *= Int(input[1])!
    }
    
    let number = numberTable[number] ?? Int(number)!
    
    result += number * count
}

print(result)
