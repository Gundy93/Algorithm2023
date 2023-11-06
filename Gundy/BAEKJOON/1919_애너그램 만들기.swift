func solution() {
    let firstText: String = readLine()!
    let secondText: String = readLine()!
    var firstCount: [Character: Int] = [:]
    var secondCount: [Character: Int] = [:]
    for character in firstText {
        firstCount[character, default: 0] += 1
    }
    for character in secondText {
        secondCount[character, default: 0] += 1
    }
    var result: Int = 0
    for character in Set(firstText + secondText) {
        result += abs(firstCount[character, default: 0] - secondCount[character, default: 0])
    }
    print(result)
}

solution()
