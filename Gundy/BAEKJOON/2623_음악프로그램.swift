let input = readLine()!.split(separator: " ").map { Int($0)! }
var previous = Array(repeating: Set<Int>(), count: input[0]+1)
var next = [Int : Set<Int>]()

for _ in 0..<input[1] {
    let singers = readLine()!.split(separator: " ").map { Int($0)! }
    
    for index in 1..<singers.count-1 {
        previous[singers[index+1]].insert(singers[index])
        next[singers[index], default: []].insert(singers[index+1])
    }
}

var singers = [Int]()

for singer in 1...input[0] where previous[singer].isEmpty {
    singers.append(singer)
}

var result = [String]()

while let singer = singers.popLast() {
    result.append(String(singer))
    
    for next in next[singer, default: []] {
        previous[next].remove(singer)
        
        if previous[next].isEmpty {
            singers.append(next)
        }
    }
}

print(result.count == input[0] ? result.joined(separator: "\n") : 0)
