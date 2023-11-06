func solution() {
    let input: String = readLine()!
    var stack: [Character] = []
    var last: Character = " "
    var result: Int = 0
    for character in input {
        switch character {
        case "(":
            stack.append(character)
        default:
            stack.removeLast()
            if last == character {
                result += 1
            } else {
                result += stack.count
            }
        }
        last = character
    }
    print(result)
}

solution()
