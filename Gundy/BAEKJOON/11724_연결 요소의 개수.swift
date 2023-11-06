let input = readLine()!.split(separator: " ").compactMap { Int($0) }
var linking = [Int: [Int]]()
var isVisited = Array(repeating: false, count: input[0] + 1)
var result = 0

for node in 1...input[0] {
    linking[node] = []
}

for _ in stride(from: 1, through: input[1], by: 1) {
    let link = readLine()!.split(separator: " ").compactMap { Int($0) }
    linking[link[0]]?.append(link[1])
    linking[link[1]]?.append(link[0])
}

for node in 1...input[0] {
    guard isVisited[node] == false else {
        continue
    }

    var needVisit = [node]

    while needVisit.isEmpty == false {
        let node = needVisit.removeLast()

        guard isVisited[node] == false else {
            continue
        }

        isVisited[node] = true
        needVisit += linking[node]!
    }

    result += 1
}

print(result)
