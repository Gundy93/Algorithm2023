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

func solution() {
    let fileIO = FileIO()
    let numberOfNodes = fileIO.readInt()
    let numberOfInputs = fileIO.readInt()
    var links = [[Int]]()
    
    for _ in 0..<numberOfInputs {
        links.append([fileIO.readInt(), fileIO.readInt(), fileIO.readInt()])
    }
    
    links.sort { $0[2] < $1[2] }
    
    var parents = Array(0...numberOfNodes)
    
    func root(_ node: Int) -> (Int, Int) {
        var node = node
        var parent = parents[node]
        var count = 0
        
        while node != parent {
            node = parent
            parent = parents[node]
            count += 1
        }
        
        return (parent, count)
    }
    
    var index = 0
    var count = 0
    var result = 0
    
    while count < numberOfNodes-2,
          index < numberOfInputs {
        let link = links[index]
        let left = root(link[0])
        let right = root(link[1])
        
        index += 1
        
        guard left.0 != right.0 else { continue }
        
        if left.1 < right.1 {
            parents[left.0] = right.0
        } else {
            parents[right.0] = left.0
        }
        
        count += 1
        result += link[2]
    }
    
    print(result)
}

solution()
