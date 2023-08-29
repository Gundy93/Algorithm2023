func solution(_ n:Int, _ lighthouse:[[Int]]) -> Int {
    var result = 0
    var links = [Int: Set<Int>]()
    for house in lighthouse {
        links[house[0], default: []].insert(house[1])
        links[house[1], default: []].insert(house[0])
    }
    var head = (0, 0)
    for number in 1...n {
        let count = links[number]!.count
        if count > head.1 {
            head = (number, count)
        } 
    }
    var visited = Set<Int>()
    func recursion(_ number: Int, _ from: Int) -> Int {
        let numbers = links[number]!.subtracting([from])
        guard numbers.isEmpty == false else { return 0 }
        visited.insert(number)
        var needOn = false
        for next in numbers {
            if recursion(next, number) == 0 {
                needOn = true
            }
        }
        if needOn {
            result += 1
            return 1
        } else {
            return 0
        }
    }
    recursion(head.0, 0)
    return result
}
