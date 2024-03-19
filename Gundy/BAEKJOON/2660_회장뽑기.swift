let count = Int(readLine()!)!
var friends = Array(
    repeating: [Int](),
    count: count+1
)

while let input = readLine(),
      input != "-1 -1" {
    let numbers = input.split(separator: " ").map { Int($0)! }
    
    friends[numbers[0]].append(numbers[1])
    friends[numbers[1]].append(numbers[0])
}

func gradePoint(_ friend: Int) -> Int {
    var visited = Set<Int>()
    var needVisit = [(friend, 0)]
    var index = 0
    var result = 0
    
    while index < needVisit.count {
        let (current, point) = needVisit[index]
        
        index += 1
        
        guard visited.contains(current) == false else { continue }
        
        visited.insert(current)
        result = max(result, point)
        needVisit += friends[current].map { ($0, point+1) }
    }
    
    return result
}

var result = [Int : [Int]]()

for friend in 1...count {
    let point = gradePoint(friend)
    
    result[point, default: []].append(friend)
}

for point in 1... {
    if let result = result[point] {
        print(point, " ", result.count, "\n", result.map(String.init).joined(separator: " "), separator: "")
        break
    }
}
