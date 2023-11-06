let input = readLine()!

let alphabet: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

var result = String()

for i in 0..<alphabet.count {
    result += String(input.filter({ $0 == alphabet[i] }).count)
    guard i != alphabet.count - 1 else {
        break
    }
    result += " "
}

print(result)
