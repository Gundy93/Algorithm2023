let input = readLine()!.split(separator: " ").map{ Int($0)! }
var target = input[1]
var coins = [Int]()

for _ in 0..<input[0] {
    coins.append(Int(readLine()!)!)
}

var result = 0

for coin in coins.reversed() {
    result += target / coin
    target %= coin
}

print(result)
