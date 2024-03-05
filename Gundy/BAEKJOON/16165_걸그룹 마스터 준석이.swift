let input = readLine()!.split(separator: " ").map { Int($0)! }
var idols = [String : Set<String>]()

for _ in 0..<input[0] {
    let groupName = readLine()!
    let count = Int(readLine()!)!
    
    for _ in 0..<count {
        idols[groupName, default: []].insert(readLine()!)
    }
}

var result = ""

for _ in 0..<input[1] {
    let name = readLine()!
    let isGroup = readLine() == "0"
    
    if isGroup {
        result += idols[name]!.sorted().joined(separator: "\n") + "\n"
    } else {
        for group in idols {
            if group.value.contains(name) {
                result += group.key + "\n"
                break
            }
        }
    }
}

print(result)
