var friendList = [Int: [Int]]()
let numberOfFriends = Int(readLine()!)!

for _ in 1...Int(readLine()!)! {
    let friends = readLine()!.split(separator: " ").compactMap { Int($0) }
    friendList[friends[0], default: []].append(friends[1])
    friendList[friends[1], default: []].append(friends[0])
}

var guests = Set<Int>()

if let friends = friendList[1] {
    for friend in friends {
        guests.insert(friend)
        guests = guests.union(friendList[friend]!)
    }
    
    guests.remove(1)
}

print(guests.count)
