let text = readLine()!.uppercased()
var counter = [Character: Int]()

text.forEach { word in
    counter[word, default: 0] += 1
}

let result = counter.keys.map { ($0, counter[$0]!) }.sorted { $0.1 < $1.1 }

print(result.filter { $0.1 == result.last?.1 }.count == 1 ? result.last!.0 : "?")
