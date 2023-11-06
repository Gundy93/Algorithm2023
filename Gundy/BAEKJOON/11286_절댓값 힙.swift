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

    mutating func remove() -> Element? {
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

var minimumHeap = Heap<(Int, Int)>(condition: <)

for _ in 1...Int(readLine()!)! {
    let number = Int(readLine()!)!
    switch number {
    case 0:
        guard let minimumNumber = minimumHeap.remove() else {
            print(0)
            continue
        }
        print(minimumNumber.1)
    default:
        minimumHeap.insert((abs(number), number))
    }
}
