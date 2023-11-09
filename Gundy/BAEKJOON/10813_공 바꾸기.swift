let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var baskets = Array(stride(from: 0, through: input[0], by: 1))

stride(from: 1, through: input[1], by: 1).forEach { _ in
    let indices = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    baskets.swapAt(indices[0], indices[1])
}
print(stride(from: 1, through: input[0], by: 1).map { String(baskets[$0]) }.joined(separator: " "))
