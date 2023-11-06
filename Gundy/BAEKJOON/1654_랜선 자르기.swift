let input = readLine()!.split(separator: " ").compactMap({ Int($0) })
var lanLines = [Int]()

for _ in 1...input[0] {
    lanLines.append(Int(readLine()!)!)
}

lanLines.sort()

print(solution())

func numberOfLanLine(longgerThan length: Int) -> Int {
    return lanLines.map({ $0 / length }).reduce(0, +)
}

func solution() -> Int {
    var start = 1
    var end = lanLines[lanLines.count - 1]
    while start <= end {
        let half = (start + end) / 2
        if numberOfLanLine(longgerThan: half) >= input[1] {
            start = half + 1
        } else {
            end = half - 1
        }
    }
    return end
}
