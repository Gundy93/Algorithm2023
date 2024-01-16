let count = Int(readLine()!)!
var words = Set<String>()

for _ in 0..<count {
    words.insert(readLine()!)
}

print(words.sorted { ($0.count, $0) < ($1.count, $1) }.joined(separator: "\n"))
