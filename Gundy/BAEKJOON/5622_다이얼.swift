let alphabets: [Set<Character>] = [[], [], [], ["A", "B", "C"], ["D", "E", "F"], ["G", "H", "I"], ["J", "K", "L"], ["M", "N", "O"], ["P", "Q", "R", "S"], ["T", "U", "V"], ["W", "X", "Y", "Z"]]
let text = readLine()!
var result = 0

text.forEach { word in
    for index in 3...10 {
        if alphabets[index].contains(word) {
            result += index
            break
        }
    }
}

print(result)
