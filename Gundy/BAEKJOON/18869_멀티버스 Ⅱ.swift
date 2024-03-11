let input = readLine()!.split(separator: " ").map { Int($0)! }
var universes = [[Int]]()

for _ in 0..<input[0] {
    var universe = readLine()!.split(separator: " ").map { Int($0)! }.enumerated().sorted() { $0.element < $1.element }
    
    for index in 0..<input[1]-1 {
        if universe[index].element == universe[index+1].element {
            universe[index+1].offset = index
        }
    }
    
    universes.append(universe.map { $0.offset })
}

var result = 0

for first in 0..<input[0]-1 {
    for second in first+1..<input[0] {
        if universes[first] == universes[second] {
            result += 1
        }
    }
}

print(result)
