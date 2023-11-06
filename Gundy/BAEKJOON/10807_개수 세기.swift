func solution() {
    let _ = readLine()
    let numbers: [Int] = readLine()!.split(separator: " ").compactMap({ Int($0) })
    let target: Int = Int(readLine()!)!
    print(numbers.filter({ $0 == target }).count)
}

solution()
