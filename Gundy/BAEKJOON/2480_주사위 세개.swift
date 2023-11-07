let dices = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let (a, b, c) = (dices[0], dices[1], dices[2])
var reward = Int()

if a == b, a == c {
    reward = 10000 + a * 1000
} else if a == b {
    reward = 1000 + a * 100
} else if a == c {
    reward = 1000 + a * 100
} else if b == c {
    reward = 1000 + b * 100
} else {
    reward = max(a, max(b, c)) * 100
}

print(reward)
