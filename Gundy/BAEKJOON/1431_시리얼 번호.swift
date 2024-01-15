func serialSort(_ lhs: String, _ rhs: String) -> Bool {
    guard lhs.count == rhs.count
    else { return lhs.count < rhs.count }
    
    let lhsSum = lhs.compactMap({ Int(String($0)) }).reduce(0, +)
    let rhsSum = rhs.compactMap({ Int(String($0)) }).reduce(0, +)
    
    guard lhsSum == rhsSum
    else { return lhsSum < rhsSum }
    
    return lhs < rhs
}

let count = Int(readLine()!)!
var serials = [String]()

(0..<count)
    .forEach { _ in
        serials.append(readLine()!)
    }

print(serials.sorted(by: serialSort).joined(separator: "\n"))
