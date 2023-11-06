let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let coins: [Int] = {
    var coins = [Int]()

    for _ in 1...input[0] {
        coins.append(Int(readLine()!)!)
    }

    return coins
}()
var remainingMoney = input[1]
var currentIndex = input[0] - 1
var result = 0

while remainingMoney > 0 {
    guard coins[currentIndex] <= remainingMoney else {
        currentIndex -= 1
        continue
    }
    remainingMoney -= coins[currentIndex]
    result += 1
}

print(result)
