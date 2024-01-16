_ = readLine()
let input = readLine()!.split(separator: " ").map(String.init)
var countAndFirst = [String : (count: Int, first: Int)]()

for index in 0..<input.count {
    countAndFirst[input[index], default: (0, index)].0 += 1
}

print(countAndFirst.sorted { ($0.value.count, $1.value.first) > ($1.value.count, $0.value.first) }.map { String(repeating: $0.key + " ", count: $0.value.0) }.joined())
