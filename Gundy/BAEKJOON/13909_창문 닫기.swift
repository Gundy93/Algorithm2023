let count = Int(readLine()!)!
var result = 0
var number = 1

while number * number <= count {
    result += 1
    number += 1
}

print(result)
