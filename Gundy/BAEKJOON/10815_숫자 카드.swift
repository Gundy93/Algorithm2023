let _ = readLine()
let cards = Set(readLine()!.split(separator: " ").map(String.init))
let _ = readLine()

print(readLine()!.split(separator: " ").map { cards.contains(String($0)) ? "1" : "0" }.joined(separator: " "))
