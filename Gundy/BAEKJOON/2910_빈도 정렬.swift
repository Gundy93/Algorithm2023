let input = readLine()!.split(separator: " ").map { Int($0)! }
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var counts = [Int: Int]()
var firstIndices = [Int: Int]()

for (index, number) in numbers.enumerated() {
    counts[number, default: 0] += 1
    
    guard firstIndices[number] == nil
    else { continue }
    
    firstIndices[number] = index
}

let result = firstIndices.keys.sorted() { counts[$0]! != counts[$1]! ? counts[$0]! > counts[$1]! : firstIndices[$0]! < firstIndices[$1]! }

print(result.map { Array(repeating: String($0), count: counts[$0]!).joined(separator: " ") }.joined(separator: " "))
