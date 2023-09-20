struct Heap<T> {
    private(set) var box: [T]
    private var condition: (T, T) -> Bool
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }
    
    init(_ elements: [T] = [], _ condition: @escaping (T, T) -> Bool) {
        box = elements
        self.condition = condition
    }
    
    private func getSuperIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }
    
    private func getLeftIndex(of index: Int) -> Int {
        return index * 2 + 1
    }
    
    private func getRightIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
    
    mutating func insert(_ newElement: T) {
        box.append(newElement)
        guard count > 1 else { return }
        var index = count - 1
        while index > 0 {
            let superIndex = getSuperIndex(of: index)
            guard condition(box[index], box[superIndex]) else { return }
            box.swapAt(superIndex, index)
            index = superIndex
        }
    }
    
    mutating func removeFirst() -> T? {
        guard count > 1 else { return box.popLast() }
        box.swapAt(0, count - 1)
        let element = box.removeLast()
        var index = 0
        while index < count - 1 {
            var superIndex = index
            let leftIndex = getLeftIndex(of: index)
            let rightIndex = getRightIndex(of: index)
            if leftIndex < count, condition(box[leftIndex], box[superIndex]) {
                superIndex = leftIndex
            }
            if rightIndex < count, condition(box[rightIndex], box[superIndex]) {
                superIndex = rightIndex
            }
            guard index != superIndex else { break }
            box.swapAt(index, superIndex)
            index = superIndex
        }
        return element
    }
}

let input = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
let numberOfPoints = input[0]
let numberOfLinks = input[1]
let start = Int(readLine()!)!
var costs = Array(repeating: [Int: Int](), count: numberOfPoints + 1)
for _ in 1...numberOfLinks {
    let link = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    costs[link[0]][link[1]] = min(link[2], costs[link[0]][link[1], default: Int.max])
}
var needVisit = Heap([(start, 0)]) { $0.1 < $1.1 }
var costForStart = Array(repeating: Int.max, count: numberOfPoints + 1)
while needVisit.isEmpty == false {
    let now = needVisit.removeFirst()!
    guard costForStart[now.0] > now.1 else { continue }
    costForStart[now.0] = now.1
    for key in costs[now.0].keys {
        needVisit.insert((key, now.1 + costs[now.0][key]!))
    }
}
for point in 1...numberOfPoints {
    print(costForStart[point] == Int.max ? "INF" : costForStart[point])
}
