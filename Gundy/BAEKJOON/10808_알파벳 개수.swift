let alphabets = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
let text = readLine()!.map(String.init)
var counter = [String: Int]()

text.forEach { counter[$0, default: 0] += 1 }
print(alphabets.map({ String(counter[$0, default: 0]) }).joined(separator: " "))
