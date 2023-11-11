let countOfCases = Int(readLine()!)!
var result = 0

stride(from: 1, through: countOfCases, by: 1).forEach { _ in
    let text = readLine()!
    var words = Set<Character>()
    var last: Character? = nil
    var isGrouped = true

    for word in text {
        if last == word {
            continue
        } else if words.contains(word) {
            isGrouped = false
            
            break
        }
        
        last = word
        words.insert(word)
    }

    if isGrouped {
        result += 1
    }
}

print(result)
