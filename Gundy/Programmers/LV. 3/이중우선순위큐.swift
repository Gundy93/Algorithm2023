struct Heap<Element> {
    private var container: [Element]
    var isEmpty: Bool {
        return container.isEmpty
    }
    var count: Int {
        return container.count
    }
    private var condition: (Element, Element) -> Bool

    init(_ elements: [Element] = [], condition: @escaping (Element, Element) -> Bool) {
        container = elements
        self.condition = condition
    }

    mutating func insert(_ newElement: Element) {
        container.append(newElement)

        var index = count - 1
        var parentIndex = getParentIndex(of: index)

        while index > 0,
              condition(container[index], container[parentIndex]) {
            container.swapAt(index, parentIndex)
            index = parentIndex
            parentIndex = getParentIndex(of: index)
        }
    }

    mutating func removeFirst() -> Element? {
        guard isEmpty == false else {
            return nil
        }

        container.swapAt(0, container.count - 1)

        let element = container.removeLast()
        var index = 0

        while index < count {
            let leftChildIndex = getLeftChildIndex(of: index)
            let rightChildIndex = getRightChildIndex(of: index)
            var parentIndex = index

            if leftChildIndex < count,
               condition(container[leftChildIndex], container[parentIndex]) {
                parentIndex = leftChildIndex
            }

            if rightChildIndex < count,
               condition(container[rightChildIndex], container[parentIndex]) {
                parentIndex = rightChildIndex
            }

            guard index != parentIndex else {
                break
            }

            container.swapAt(index, parentIndex)
            index = parentIndex
        }
        return element
    }

    mutating func removeLast() -> Element? {
        guard isEmpty == false else { return nil }
        container.sort(by: condition)
        return container.removeLast()
    }

    private func getParentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func getLeftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }

    private func getRightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }
}

func solution(_ operations:[String]) -> [Int] {
    var heap = Heap<Int>(condition: >)
    for operation in operations {
        let command = operation.split(separator: " ").map(String.init)
        switch command[0] {
        case "I":
            heap.insert(Int(command[1])!)
        default:
            if command[1] == "1" {
                let _ = heap.removeFirst()
            } else {
                let _ = heap.removeLast()
            }
        }
    }
    var max = heap.removeFirst()
    let min = heap.removeLast()
    if max == nil {
        return [0, 0]
    }
    return [max!, min ?? max!]
}
