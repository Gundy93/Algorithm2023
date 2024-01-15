let count = Int(readLine()!)!
var cards = [Int : Int]()

(0..<count)
    .forEach { _ in
        cards[Int(readLine()!)!, default: 0] += 1
    }

print(cards.sorted { $0.value == $1.value ? $0.key < $1.key : $0.value > $1.value }[0].key)
