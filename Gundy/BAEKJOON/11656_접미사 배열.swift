let input = readLine()!
var sufficis = [input]

for count in 1..<input.count {
    sufficis.append(String(input.dropFirst(count)))
}

sufficis.sort()

print(sufficis.joined(separator: "\n"))
