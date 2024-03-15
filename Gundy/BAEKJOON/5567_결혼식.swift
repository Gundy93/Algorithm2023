_ = readLine()
let count = Int(readLine()!)!
var friends = [Int : [Int]]()

for _ in 0..<count {
    let people = readLine()!.split(separator: " ").map { Int($0)! }
    
    friends[people[0], default: []].append(people[1])
    friends[people[1], default: []].append(people[0])
}

var visited = Set<Int>()
var people = [(1, 0)]
var index = 0

while index < people.count {
    let (friend, distance) = people[index]
    index += 1
    
    guard visited.contains(friend) == false,
          distance <= 2 else { continue }
    
    visited.insert(friend)
    people += friends[friend, default: []].map { ($0, distance+1) }
}

print(visited.count-1)
