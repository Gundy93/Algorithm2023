let partialSum = readLine()!.split(separator: "-").map { String($0).split(separator: "+").map { Int($0)! }.reduce(0, +) }
var result = partialSum[0]

for index in 1..<partialSum.count {
    result -= partialSum[index]
}

print(result)
