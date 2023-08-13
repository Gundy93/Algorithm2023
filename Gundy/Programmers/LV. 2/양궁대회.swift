struct Queue<T> {
    private var output = [T]()
    private var input: [T]
    var isEmpty: Bool { return output.isEmpty && input.isEmpty }

    init(_ elements: [T]) {
        input = elements
    }

    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            guard input.isEmpty == false else { return nil }
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    var count = [Int: Int]()
    for (index, number) in info.enumerated() {
        count[10 - index] = number
    }
    var result = [-1]
    var scoreDifference = 0
    var queue = Queue([([Int](), 10, 0)])
    while queue.isEmpty == false {
        let (numbers, now, number) = queue.dequeue()!
        guard now > 0 else {
            let numbers = numbers + [n - number]
            var scoreA = 0
            var scoreR = 0
            for ((index, apeach), ryan) in zip(info.enumerated(), numbers) {
                if apeach == 0, ryan == 0 {
                    continue
                }
                if apeach >= ryan {
                    scoreA += 10 - index
                } else {
                    scoreR += 10 - index
                }
            }
            if scoreR > scoreA, scoreR - scoreA >= scoreDifference {
                if result != [-1], scoreR - scoreA == scoreDifference {
                    var isValid = true
                    for (origin, new) in zip(result[0...9].reversed(), numbers[0...9].reversed()) {
                        if origin > new {
                            isValid = false
                            break
                        } else if origin < new {
                            break
                        }
                    }
                    guard isValid else { continue }
                }
                result = numbers
                scoreDifference = scoreR - scoreA
            }
            continue
        }
        if let apeach = count[now], apeach < n - number {
            queue.enqueue((numbers + [apeach + 1], now - 1, number + apeach + 1))
        }
        queue.enqueue((numbers + [0], now - 1, number))
    }
    return result
}
