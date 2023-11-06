func solution() {
    let dices: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
    var defaultReward: Int = 0
    var additionalReward: Int = 100
    var number: Int = 0
    switch Set(dices).count {
    case 1:
        defaultReward = 10000
        additionalReward = 1000
        number = dices[0]
    case 2:
        defaultReward = 1000
        number = dices[1]
    default:
        number = dices[2]
    }
    print(defaultReward + (additionalReward * number))
}

solution()
