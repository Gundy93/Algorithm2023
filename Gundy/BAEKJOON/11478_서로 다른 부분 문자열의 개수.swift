let input = readLine()!.map(String.init)
var substrings = Set<String>()

for startIndex in 0...input.count - 1 {
    var text = String()
    
    for endIndex in startIndex...input.count - 1 {
        text += input[endIndex]
        substrings.insert(text)
    }
}

print(substrings.count)
