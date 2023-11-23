let count = Int(readLine()!)!
var chongChongs = Set(["ChongChong"])

for _ in 1...count {
    let people = readLine()!.split(separator: " ").map(String.init)
    
    if chongChongs.contains(people[0]) {
        chongChongs.insert(people[1])
    } else if chongChongs.contains(people[1]) {
        chongChongs.insert(people[0])
    }
}

print(chongChongs.count)
