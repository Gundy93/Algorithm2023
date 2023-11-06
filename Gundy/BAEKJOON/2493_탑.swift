let numberOfTowers = Int(readLine()!)!
let towers = readLine()!.split(separator: " ").compactMap({ Int($0) })
var result = Array(repeating: "0", count: numberOfTowers)
var stack = [(tower: Int, index: Int)]()

for (index, tower) in towers.enumerated().reversed() {
    while stack.isEmpty == false,
          stack.last!.tower < tower {
        let last = stack.removeLast()
        result[last.index] = String(index + 1)
    }
    stack.append((tower, index))
}

print(result.joined(separator: " "))
