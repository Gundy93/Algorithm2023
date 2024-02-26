var target = Int(readLine()!)!
var number = 1

while target > number {
    target -= number
    number += 1
}

if number % 2 == 1 {
    print(number - target + 1, "/", target, separator: "")
} else {
    print(target, "/", number - target + 1, separator: "")
}
