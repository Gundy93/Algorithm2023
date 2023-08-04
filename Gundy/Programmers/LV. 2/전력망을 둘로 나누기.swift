func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var links = [Int: Set<Int>]()
    for wire in wires {
        links[wire[0], default: []].insert(wire[1])
        links[wire[1], default: []].insert(wire[0])
    }
    var result = n
    for wire in wires {
        var newLinks = links
        newLinks[wire[0]]!.remove(wire[1])
        newLinks[wire[1]]!.remove(wire[0])
        var firstGroup = 0
        var firstNeedVisit = [wire[0]]
        var firstVisited = Set<Int>()
        while firstNeedVisit.isEmpty == false {
            let node = firstNeedVisit.removeLast()
            guard firstVisited.contains(node) == false else { continue }
            firstVisited.insert(node)
            firstGroup += 1
            firstNeedVisit += Array(newLinks[node]!)
        }
        var secondGroup = 0
        var secondNeedVisit = [wire[1]]
        var secondVisited = Set<Int>()
        while secondNeedVisit.isEmpty == false {
            let node = secondNeedVisit.removeLast()
            guard secondVisited.contains(node) == false else { continue }
            secondVisited.insert(node)
            secondGroup += 1
            secondNeedVisit += Array(newLinks[node]!)
        }
        if result > abs(firstGroup - secondGroup) {
            result = abs(firstGroup - secondGroup)
        }
    }
    return result
}
