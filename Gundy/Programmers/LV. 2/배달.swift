func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var links = [Int: Set<Int>]()
    var times = [[Int]: Int]()
    for link in road {
        links[link[0], default: []].insert(link[1])
        links[link[1], default: []].insert(link[0])
        if times[[link[0], link[1]]] == nil || times[[link[0], link[1]]]! > link[2] {
            times[[link[0], link[1]]] = link[2]
            times[[link[1], link[0]]] = link[2]
        }
    }
    var answer = 0
    var needVisit = [(1, 0)]
    var visited = [Int: Int]()
    while needVisit.isEmpty == false {
        let (town, time) = needVisit.removeLast()
        if visited[town] == nil {
            answer += 1
        }
        guard visited[town] == nil || visited[town]! > time else { continue }
        visited[town] = time
        for link in links[town, default: []] {
            guard time + times[[town, link]]! <= k else { continue }
            needVisit.append((link, time + times[[town, link]]!))
        }
    }
    return answer
}
