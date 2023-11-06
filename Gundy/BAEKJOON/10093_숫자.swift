func solution() {
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
    let smallNumber: Int = numbers[0]
    let bigNumber: Int = numbers[1]
    if bigNumber == smallNumber {
        print(0)
    } else {
        print(bigNumber - smallNumber - 1)
        print(stride(from: smallNumber + 1, to: bigNumber, by: 1).map({ String($0) }).joined(separator: " "))
    }
}

solution()
