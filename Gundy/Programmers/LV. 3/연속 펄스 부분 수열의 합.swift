func solution(_ sequence:[Int]) -> Int64 {
    var positives = [Int]()
    var negatives = [Int]()
    for index in 0...sequence.count - 1 {
        if index % 2 == 0 {
            positives.append(sequence[index])
            negatives.append(-sequence[index])
        } else {
            positives.append(-sequence[index])
            negatives.append(sequence[index])
        }
    }
    var positiveDP = Array(repeating: 0, count: sequence.count)
    var negativeDP = Array(repeating: 0, count: sequence.count)
    positiveDP[0] = max(0, positives[0])
    negativeDP[0] = max(0, negatives[0])
    for index in stride(from: 1, to: sequence.count, by: 1) {
        positiveDP[index] = max(positiveDP[index - 1] + positives[index], positives[index])
        negativeDP[index] = max(negativeDP[index - 1] + negatives[index], negatives[index])
    }
    return Int64(max(positiveDP.max()!, negativeDP.max()!))
}
