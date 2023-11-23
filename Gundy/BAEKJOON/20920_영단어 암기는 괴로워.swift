let input = readLine()!.split(separator: " ").map { Int($0)! }
var counter = [String: Int]()

for _ in 1...input[0] {
    let word = readLine()!
    
    guard word.count >= input[1] else { continue }
    
    counter[word, default: 0] += 1
}

var result = counter.keys.map { $0 }.sorted { counter[$0]! != counter[$1]! ? counter[$0]! > counter[$1]! : $0.count != $1.count ? $0.count > $1.count : $0 < $1 }.joined(separator: "\n")

print(result)
