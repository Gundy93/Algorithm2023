struct Heap<T> {
    private(set) var box: [T] = []
    private var condition: (T, T) -> Bool
    var first: T? { box.first }
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }
    
    init(_ condition: @escaping (T, T) -> Bool) {
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
    
    @discardableResult
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

let input = readLine()!.split(separator: " ").map { Int($0)! }
var jewels = [(cost: Int, value: Int)]()
var bags = [Int]()

for _ in 0..<input[0] {
    let jewel = readLine()!.split(separator: " ").map { Int($0)! }
    
    jewels.append((jewel[0], jewel[1]))
}

for _ in 0..<input[1] {
    bags.append(Int(readLine()!)!)
}

jewels.sort() { $0.cost < $1.cost }
bags.sort()

var heap = Heap<(cost: Int, value: Int)>() { $0.value > $1.value }
var index = 0
var result = 0

for bag in bags {
    while index < input[0],
          jewels[index].cost <= bag {
        heap.insert(jewels[index])
        index += 1
    }
    
    result += heap.removeFirst()?.value ?? 0
}

print(result)
