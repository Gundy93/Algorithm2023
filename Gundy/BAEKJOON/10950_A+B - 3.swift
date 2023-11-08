let times = Int(readLine()!)!

stride(from: 1, through: times, by: 1).forEach { _ in
    let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    
    print(numbers[0] + numbers[1])
}
