var cards = Array(1...Int(readLine()!)!)
var index = 0

while index < cards.count {
    index += 1
    if index < cards.count {
        cards.append(cards[index])
        index += 1
    }
}

print(cards[cards.count - 1])
