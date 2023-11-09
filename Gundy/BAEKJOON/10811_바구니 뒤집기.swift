let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var baskets = stride(from: 0, through: input[0], by: 1).map(String.init)

stride(from: 1, through: input[1], by: 1).forEach { _ in
    let indices = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    baskets = Array(baskets[0...indices[0] - 1]) + Array(baskets[indices[0]...indices[1]]).reversed() + stride(from: indices[1] + 1, through: input[0], by: 1).map { baskets[$0] }
}
print(baskets[1...input[0]].joined(separator: " "))
