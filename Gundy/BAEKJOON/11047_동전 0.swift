let input = readLine()!.split(separator: " ").map { Int($0)! }
var coins = [Int]()

for _ in 1...input[0] {
    coins.append(Int(readLine()!)!)
}

coins.sort(by: >)

var target = input[1]
var result = 0

for index in 0...coins.count - 1 {
    guard target > 0 else { break }
    
    let coin = coins[index]
    
    result += target / coin
    target %= coin
}

print(result)
