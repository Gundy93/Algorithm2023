let count = Int(readLine()!)!
var result = 0
var emoticon = Set<String>()

for _ in 1...count {
    let input = readLine()!
    
    guard input != "ENTER" else {
        result += emoticon.count
        emoticon.removeAll()
        
        continue
    }
    
    emoticon.insert(input)
}

print(result + emoticon.count)
