import Foundation

struct MinHeap {
    private var container = [Int]()
    var first: Int? { return container.first }
    var count: Int { return container.count }
    mutating func insert(_ newElement: Int) {
        container.append(newElement)
        guard container.count > 1 else { return }
        var index = container.count-1
        while index > 0 {
            let parent = (index-1) / 2
            guard container[index] < container[parent] else { return }
            container.swapAt(parent, index)
            index = parent
        }
    }
    mutating func removeFirst() -> Int? {
        if container.count <= 1 { return container.popLast() }
        container.swapAt(0, container.count-1)
        let element = container.popLast()
        var index = 0
        while index < container.count-1 {
            var current = index
            let left = index * 2 + 1
            if left < container.count,
               container[current] > container[left] { current = left }
            let right = index * 2 + 2
            if right < container.count,
               container[current] > container[right] { current = right }
            guard current != index else { break }
            container.swapAt(index, current)
            index = current
        }
        return element
    }
}

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var heap = MinHeap()
    var result = [Int]()
    
    for point in score {
        heap.insert(point)
        
        if heap.count > k { _ = heap.removeFirst() }
        
        result.append(heap.first!)
    }
    
    return result
}
