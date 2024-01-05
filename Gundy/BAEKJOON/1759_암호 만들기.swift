let input = readLine()!.split(separator: " ").map { Int($0)! }
let characters = readLine()!.split(separator: " ").map(String.init).sorted()
let vowel = Set(["a", "e", "i", "o", "u"])
var stack = String()
var indices = [Int]()
var consonants = 0
var vowels = 0
var result = String()

func backtracking() {
    guard stack.count < input[0] else {
        if consonants >= 2,
           vowels >= 1 {
            result += stack + "\n"
        }
        
        return
    }
    
    let last = indices.last ?? -1
    
    for index in last + 1..<input[1] {
        if vowel.contains(characters[index]) {
            vowels += 1
            stack += characters[index]
            indices.append(index)
            backtracking()
            indices.removeLast()
            stack.removeLast()
            vowels -= 1
        } else {
            consonants += 1
            stack += characters[index]
            indices.append(index)
            backtracking()
            indices.removeLast()
            stack.removeLast()
            consonants -= 1
        }
    }
}

backtracking()
print(result)
