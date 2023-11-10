let text = readLine()!
var counter = [Character: Int]()

text.enumerated().forEach { word in
    if counter[word.element] == nil {
        counter[word.element] = word.offset
    }
}

print("abcdefghijklmnopqrstuvwxyz".map { String(counter[$0, default: -1]) }.joined(separator: " "))
