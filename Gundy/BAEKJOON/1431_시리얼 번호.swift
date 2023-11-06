let numberOfGuitars = Int(readLine()!)!
let guitars: [String] = {
    var guitars = [String]()
    for _ in 1...numberOfGuitars {
        guitars.append(readLine()!)
    }

    return guitars
}()
let sortedGuitars = guitars.sorted { smallText, bigText in
    guard smallText.count == bigText.count else { return smallText.count < bigText.count }
    let smallSum = smallText.compactMap({ Int(String($0)) }).reduce(0, +)
    let bigSum = bigText.compactMap({ Int(String($0)) }).reduce(0, +)
    guard smallSum == bigSum else { return smallSum < bigSum }
    return smallText < bigText
}

for guitar in sortedGuitars {
    print(guitar)
}
