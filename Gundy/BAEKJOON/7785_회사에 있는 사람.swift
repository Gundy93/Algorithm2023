let count = Int(readLine()!)!
var people = Set<String>()

for _ in 1...count {
    let log = readLine()!.split(separator: " ").map(String.init)
    
    if log[1] == "enter" {
        people.insert(log[0])
    } else {
        people.remove(log[0])
    }
}

print(people.sorted(by: >).joined(separator: "\n"))
