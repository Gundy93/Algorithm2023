struct Heap<T> {
    private(set) var box: [T] = []
    private var condition: (T, T) -> Bool
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
let start = Int(readLine()!)!
var graph = [Int: [(point: Int, value: Int)]]()

for _ in 1...input[1] {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[link[0], default: []].append((link[1], link[2]))
}

var result = Array(repeating: Int.max, count: input[0] + 1)

var heap = Heap<(point: Int, value: Int)>() { $0.value < $1.value }

heap.insert((start, 0))

while let (point, value) = heap.removeFirst() {
    guard value < result[point] else { continue }
    
    result[point] = value
    
    for (next, extra) in graph[point, default: []] {
        heap.insert((next, value + extra))
    }
}

print(result[1...input[0]].map { $0 == Int.max ? "INF" : String($0) }.joined(separator: "\n"))
