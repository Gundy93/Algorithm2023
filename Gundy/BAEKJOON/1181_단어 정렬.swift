let count = Int(readLine()!)!
var words = Set<String>()

for _ in 1...count {
    words.insert(readLine()!)
}

var result = String()

for word in words.sorted(by: { left, right in
    return left.count == right.count ? left < right : left.count < right.count
}) {
    result += word + "\n"
}

print(result)
