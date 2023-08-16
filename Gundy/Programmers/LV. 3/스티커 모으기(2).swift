func solution(_ sticker:[Int]) -> Int {
    guard sticker.count > 2 else { return sticker.max()! }
    var zero = Array(repeating: 0, count: sticker.count)
    var nonZero = Array(repeating: 0, count: sticker.count)
    zero[0] = sticker[0]
    zero[1] = sticker[0]
    nonZero[1] = sticker[1]
    for index in stride(from: 2, through: sticker.count - 2, by: 1) {
        zero[index] = max(zero[index - 2] + sticker[index], zero[index - 1])
        nonZero[index] = max(nonZero[index - 2] + sticker[index], nonZero[index - 1])
    }
    zero[sticker.count - 1] = zero[sticker.count - 2]
    nonZero[sticker.count - 1] = max(nonZero[sticker.count - 3] + sticker[sticker.count - 1], nonZero[sticker.count - 2])
    return max(zero.last!, nonZero.last!)
}
