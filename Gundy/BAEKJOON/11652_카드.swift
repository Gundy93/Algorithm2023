let count = Int(readLine()!)!
var cards = [Int: Int]()

for _ in 1...count {
    cards[Int(readLine()!)!, default: 0] += 1
}

print(cards.max { $0.value != $1.value ? $0.value < $1.value : $0.key > $1.key }!.key)
