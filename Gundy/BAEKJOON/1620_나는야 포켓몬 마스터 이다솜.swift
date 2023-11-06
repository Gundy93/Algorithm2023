let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var encyclopedia = Array(repeating: "", count: input[0] + 1)
var hash = [String: Int]()

for number in 1...input[0] {
    let pokemon = readLine()!
    encyclopedia[number] = pokemon
    hash[pokemon] = number
}

for _ in 1...input[1] {
    let quiz = readLine()!
    if let number = Int(quiz) {
        print(encyclopedia[number])
    } else {
        print(hash[quiz]!)
    }
}
