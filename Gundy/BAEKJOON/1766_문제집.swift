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
let (numberOfQueries, numberOfInformations) = (input[0], input[1])
var log = [Int: (Set<Int>, Int)]()
for _ in 1...numberOfInformations {
    let queries = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    log[queries[0], default: ([], 0)].0.insert(queries[1])
    log[queries[1], default: ([], 0)].1 += 1
}
var result = [String]()
var heap = Heap([Int](), <)
for number in 1...numberOfQueries {
    if log[number, default: ([], 0)].1 == 0 {
        heap.insert(number)
    }
}
while heap.isEmpty == false {
    let number = heap.removeFirst()!
    result.append(String(number))
    for next in log[number, default: ([], 0)].0 {
        log[next, default: ([], 0)].1 -= 1
        if log[next, default: ([], 0)].1 == 0 {
            heap.insert(next)
        }
    }
}
print(result.joined(separator: " "))
