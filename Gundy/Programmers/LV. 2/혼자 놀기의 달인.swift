func solution(_ cards:[Int]) -> Int {
    var checked = Array(repeating: false, count: cards.count)
    var groups = [Int]()
    for index in 0...cards.count - 1 {
        guard checked[index] == false else { continue }
        checked[index] = true
        var card = cards[index]
        var count = 1
        while checked[card - 1] == false {
            checked[card - 1] = true
            card = cards[card - 1]
            count += 1
        }
        groups.append(count)
    }
    groups.sort(by: >)
    return groups.count == 1 ? 0 : groups[0] * groups[1]
}
