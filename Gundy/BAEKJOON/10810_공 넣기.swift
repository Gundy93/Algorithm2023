var baskets = [Int: String]()
let input = readLine()!.split(separator: " ").compactMap { Int($0) }

stride(from: 1, through: input[1], by: 1).forEach { _ in
    let numbers = readLine()!.split(separator: " ")
    stride(from: Int(numbers[0])!, through: Int(numbers[1])!, by: 1).forEach { number in
        baskets[number] = String(numbers[2])
    }
}
print(stride(from: 1, through: input[0], by: 1).map { baskets[$0, default: "0"] }.joined(separator: " "))
