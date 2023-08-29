struct Heap<T> {
    private var box: [T]
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

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map(String.init).compactMap(Int.init)
    let counter = [[1, 7, 6, 7, 5, 4, 5, 3, 2, 3],
                   [7, 1, 2, 4, 2, 3, 5, 4, 5, 6],
                   [6, 2, 1, 2, 3, 2, 3, 5, 4, 5],
                   [7, 4, 2, 1, 5, 3, 2, 6, 5, 4],
                   [5, 2, 3, 5, 1, 2, 4, 2, 3, 5],
                   [4, 3, 2, 3, 2, 1, 2, 3, 2, 3],
                   [5, 5, 3, 2, 4, 2, 1, 5, 3, 2],
                   [3, 4, 5, 6, 2, 3, 5, 1, 2, 4],
                   [2, 5, 4, 5, 3, 2, 3, 2, 1, 2],
                   [3, 6, 5, 4, 5, 3, 2, 4, 2, 1]]
    var dp = Array(repeating: Heap([[Int]]()){ $0[2] < $1[2] }, count: numbers.count)
    var visited = Array(repeating: Set<Set<Int>>(), count: numbers.count)
    if numbers[0] == 4 || numbers[0] == 6 {
        dp[0].insert([4, 6, 1, 1])
    } else {
        dp[0].insert([numbers[0], 6, counter[4][numbers[0]]])
        dp[0].insert([4, numbers[0], counter[6][numbers[0]]])
    }
    for index in stride(from: 1, to: numbers.count, by: 1) {
        var courses = dp[index - 1]
        let number = numbers[index]
        while courses.isEmpty == false {
            let course = courses.removeFirst()!
            guard visited[index].contains([course[0], course[1]]) == false else { continue }
            visited[index].insert([course[0], course[1]])
            if number == course[0] || number == course[1] {
                dp[index].insert([course[0], course[1], course[2] + 1])
            } else {
                dp[index].insert([number, course[1], course[2] + counter[course[0]][number]])
                dp[index].insert([course[0], number, course[2] + counter[course[1]][number]])
            }
        }
    }
    return dp[numbers.count - 1].removeFirst()![2]
}
