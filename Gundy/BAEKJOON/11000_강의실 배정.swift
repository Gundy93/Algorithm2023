import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

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

let fileIO = FileIO()
let count = fileIO.readInt()
var lectures = [(Int, Int)]()

for _ in 0..<count {
    lectures.append((fileIO.readInt(), fileIO.readInt()))
}

lectures.sort { $0 < $1 }

var heap = Heap<Int>(<)

heap.insert(lectures[0].1)

for index in 1..<count {
    let (start, end) = lectures[index]
    
    guard let first = heap.first else { break }
    
    if first <= start {
        heap.removeFirst()
    }
    
    heap.insert(end)
}

print(heap.count)
