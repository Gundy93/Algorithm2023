struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }

    init(_ elements: [T] = []) {
        input = elements
    }

    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.popLast()
    }
}

func solution(_ tickets:[[String]]) -> [String] {
    var cities = [String: [[String]]]()
    var count = [[String]: Int]()
    for ticket in tickets {
        cities[ticket[0], default: []].append([ticket[0], ticket[1]])
        count[ticket, default: 0] += 1
    }
    var needVisit = Queue<([String], [[String]: Int])>()
    for ticket in cities["ICN"]!.sorted(by: { $0[1] < $1[1] }) {
        var count = count
        count[ticket]! -= 1
        needVisit.enqueue((ticket, count))
    }
    var result = [String]()
    while needVisit.isEmpty == false {
        let now = needVisit.dequeue()!
        guard now.0.count < tickets.count + 1 else {
            result = now.0
            break
        }
        guard let next = cities[now.0.last!] else { continue }
        for city in next.sorted(by: { $0[1] < $1[1] }) {
            guard now.1[city] != 0 else { continue }
            var count = now.1
            count[city]! -= 1
            needVisit.enqueue((now.0 + [city.last!], count))
        }
    }
    return result
}
