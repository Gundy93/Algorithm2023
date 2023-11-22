let number = Int(readLine()!)!
var result = 0

for top in 1...number {
    for bottom in 1...number {
        guard top != bottom else { continue }
        
        result += 1
    }
}

print(result)
