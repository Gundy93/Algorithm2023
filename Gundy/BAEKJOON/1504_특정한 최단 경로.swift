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
var graph = [Int: [(point: Int, value: Int)]]()

for _ in stride(from: 1, through: input[1], by: 1) {
    let link = readLine()!.split(separator: " ").map { Int($0)! }
    
    graph[link[0], default: []].append((link[1], link[2]))
    graph[link[1], default: []].append((link[0], link[2]))
}

let targets = readLine()!.split(separator: " ").map { Int($0)! }
var result = -1
var visited = Array(repeating: Array(repeating: Int.max, count: input[0] + 1), count: 4)
var heap = Heap<(point: Int, value: Int, first: Bool, second: Bool)>() { $0.value < $1.value }

heap.insert((1, 0, targets[0] == 1, false))

while let (point, value, first, second) = heap.removeFirst() {
    var index = 0
    
    switch (first, second) {
    case (true, false):
        index = 1
    case (false, true):
        index = 2
    case (true, true):
        index = 3
    default:
        break
    }
    
    guard visited[index][point] > value else { continue }
    
    visited[index][point] = value
    
    if index == 3,
       point == input[0] {
        result = value
        
        continue
    }
    
    for (next, extra) in graph[point, default: []] {
        heap.insert((next, value + extra, first || next == targets[0], second || next == targets[1]))
    }
}

print(result)
