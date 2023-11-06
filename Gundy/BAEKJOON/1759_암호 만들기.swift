let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
let words = readLine()!.split(separator: " ").sorted()
var result = Set<String>()

recursion("", current: 0)

result.sorted().forEach { password in
    print(password)
}

func recursion(_ password: String, current index: Int) {
    guard password.count <= input[0] else { return }
    if validate(password) {
        result.insert(password)
    }
    guard index < words.count else { return }
    recursion(password + words[index], current: index + 1)
    recursion(password, current: index + 1)
}

func validate(_ password: String) -> Bool {
    guard password.count == input[0] else { return false }
    var vowelCount = 0
    var consonantCount = 0
    for character in password {
        if vowelCount > 0,
           consonantCount > 1 {
            break
        }
        if ["a", "e", "i", "o", "u"].contains(character) {
            vowelCount += 1
        } else {
            consonantCount += 1
        }
    }
    return vowelCount >= 1 && consonantCount >= 2
}
