let numberOfTowers = Int(readLine()!)!
var result = Array(repeating: "0", count: numberOfTowers)
var stack = [(height: Int, index: Int)]()

for (index, height) in readLine()!.split(separator: " ").map({ Int($0)! }).enumerated().reversed() {
    while stack.isEmpty == false,
          stack.last!.height < height {
        let last = stack.removeLast()
        
        result[last.index] = String(index + 1)
    }
    
    stack.append((height, index))
}

print(result.joined(separator: " "))
