let input = readLine()!
var sufficis = [String.SubSequence]()

for count in 0..<input.count {
    sufficis.append(input.dropFirst(count))
}

sufficis.sort()

print(sufficis.joined(separator: "\n"))
