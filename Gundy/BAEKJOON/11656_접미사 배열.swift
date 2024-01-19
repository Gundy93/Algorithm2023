var input = readLine()!
var last = String(input.removeLast())
var sufficis = [last]

for count in 0..<input.count {
    last = String(input.removeLast()) + last
    sufficis.append(last)
}

sufficis.sort()
print(sufficis.joined(separator: "\n"))
