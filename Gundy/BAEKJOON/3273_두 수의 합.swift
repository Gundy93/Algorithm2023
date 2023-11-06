func solution() {
    let _ = readLine()
    var numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) }).sorted()
    let target: Int = Int(readLine()!)!
    while let last = numbers.last,
          last > target {
        numbers.removeLast()
    }
    guard numbers.count > 1 else {
        print("0")
        return
    }
    var result: Int = 0
    while numbers.count > 1 {
        if numbers.first! + numbers.last! > target {
            numbers.removeLast()
        } else if numbers.first! + numbers.last! < target {
            numbers.removeFirst()
        } else {
            result += 1
            numbers.removeFirst()
            numbers.removeLast()
        }
    }
    print(result)
}

solution()
