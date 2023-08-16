func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var result = 0
    var count = [Int: Int]()
    for cost in costs {
        count[cost[0], default: 0] += 1
        count[cost[1], default: 0] += 1
    }
    var costs = costs.sorted(by: { return $0[2] == $1[2] ? max(count[$0[0]]!, count[$0[1]]!) <  max(count[$1[0]]!, count[$1[1]]!) : $0[2] > $1[2] })
    var link = [Int: Set<Int>]()
    func validate() -> Bool {
        var needVisit = [0]
        var visited = Set<Int>()
        while needVisit.isEmpty == false {
            let number = needVisit.removeLast()
            guard visited.contains(number) == false, let numbers = link[number] else { continue }
            visited.insert(number)
            needVisit += Array(numbers)
        }
        return visited.count == n
    }
    func addLink() {
        let cost = costs.removeLast()
        if link[cost[0]] == nil, link[cost[1]] == nil {
            link[cost[0], default: []].insert(cost[1])
            link[cost[1], default: []].insert(cost[0])
            result += cost[2]
        } else if link[cost[0]] == nil {
            var visited = Set<Int>()
            var needVisit = [cost[1]]
            var isLinked = false
            while needVisit.isEmpty == false {
                let now = needVisit.removeLast()
                if now == cost[0] {
                    isLinked = true
                    break
                }
                guard visited.contains(now) == false else { continue }
                visited.insert(now)
                needVisit += Array(link[now]!)
            }
            if isLinked == false {
                link[cost[0], default: []].insert(cost[1])
                link[cost[1], default: []].insert(cost[0])
                result += cost[2]
            }
        } else {
            var visited = Set<Int>()
            var needVisit = [cost[0]]
            var isLinked = false
            while needVisit.isEmpty == false {
                let now = needVisit.removeLast()
                if now == cost[1] {
                    isLinked = true
                    break
                }
                guard visited.contains(now) == false else { continue }
                visited.insert(now)
                needVisit += Array(link[now]!)
            }
            if isLinked == false {
                link[cost[0], default: []].insert(cost[1])
                link[cost[1], default: []].insert(cost[0])
                result += cost[2]
            }
        }
    }
    while link.keys.count < n {
        addLink()
    }
    while validate() == false {
        addLink()
    }
    return result
}
