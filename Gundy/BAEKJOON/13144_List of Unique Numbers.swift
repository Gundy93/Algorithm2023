let count = Int(readLine()!)!
let list = readLine()!.split(separator: " ").map(String.init)
var sequence = Set([list[0]])
var start = 0
var end = 0
var result = 0

while end+1 < count,
      sequence.contains(list[end+1]) == false {
    end += 1
    sequence.insert(list[end])
}

while end < count-1 {
    end += 1
    let text = list[end]
    
    while sequence.contains(text) {
        sequence.remove(list[start])
        start += 1
        result += end - start + 1
    }
    
    sequence.insert(text)
}

result += (1...sequence.count).reduce(0, +)
print(result)
