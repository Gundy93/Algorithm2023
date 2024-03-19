let input = readLine()!.split(separator: " ").map { Int($0)! }
var friends = Array(
    repeating: [Int](),
    count: input[0]+1
)

for _ in 0..<input[1] {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    friends[input[0]].append(input[1])
    friends[input[1]].append(input[0])
}

var baconNumbers = Array(
    repeating: Array(
        repeating: -1,
        count: input[0]+1
    ),
    count: input[0]+1
)

for number in 1...input[0] {
    var visited = Array(
        repeating: false,
        count: input[0]+1
    )
    var needVisit = [(number, 0)]
    var index = 0
    
    while index < needVisit.count {
        let (current, distance) = needVisit[index]
        
        index += 1
        
        guard visited[current] == false else { continue }
        
        visited[current] = true
        baconNumbers[number][current] = distance
        needVisit += friends[current].map { ($0, distance+1) }
    }
}

var result = [Int : [Int]]()

for friend in 1...input[0] {
    let number = baconNumbers[friend].reduce(0, +)
    
    result[number, default: []].append(friend)
}

for number in 1... {
    if let result = result[number] {
        print(result[0])
        break
    }
}
