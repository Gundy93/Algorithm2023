let numbers = readLine()!.map(String.init)
var counter = [String: Int]()

for number in numbers {
    counter[number, default: 0] += 1
}

print(counter.keys.sorted(by: >).map { String(repeating: $0, count: counter[$0]!) }.joined())
