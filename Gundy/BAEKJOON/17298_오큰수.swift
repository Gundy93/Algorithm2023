let count = Int(readLine()!)! 
var result = Array(repeating: "-1", count: count)
var stack = [(index: Int, value: Int)]()

for (index, value) in readLine()!.split(separator: " ").map({ Int($0)! }).enumerated() {
    while let last = stack.last,
          last.value < value {
        result[last.index] = String(value)
        stack.removeLast()
    }
    
    stack.append((index, value))
}

print(result.joined(separator: " "))
