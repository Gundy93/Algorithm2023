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

let fileIO = FileIO()
let count = fileIO.readInt()
var tree = [Int : [(Int, Int)]]()

for _ in 1...count {
    let node = fileIO.readInt()
    var next = fileIO.readInt()
    
    while next != -1 {
        tree[node, default: []].append((next, fileIO.readInt()))
        next = fileIO.readInt()
    }
}

var leaf = 0
var visited = Set<Int>()
var result = 0

func dfs(_ node: Int, _ depth: Int) {
    visited.insert(node)
    
    if result < depth {
        result = depth
        leaf = node
    }
    
    for (next, distance) in tree[node, default: []] {
        guard visited.contains(next) == false else { continue }
        
        dfs(next, depth + distance)
    }
}

dfs(1, 0)
visited.removeAll()
result = 0
dfs(leaf, 0)
print(result)
