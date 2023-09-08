let numberOfFields = Int(readLine()!)!
var costs = [(cost: Int, from: Int, field: Int)]()
for field in 0...numberOfFields - 1 {
    costs.append((Int(readLine()!)!, numberOfFields, field))
}
for index in 0...numberOfFields - 1 {
    let costsFromIndex = readLine()!.split(separator: " ").map(String.init).compactMap(Int.init)
    for field in 0...numberOfFields - 1 {
        guard field != index else { continue }
        costs.append((costsFromIndex[field], index, field))
    }
}
costs.sort(by: { $0.cost < $1.cost })
var roots = Array(stride(from: 0, through: numberOfFields, by: 1))
func findRoot(_ field: Int) -> Int {
    guard roots[field] != field else { return field }
    return findRoot(roots[field])
}
func union(_ first: Int, _ second: Int) -> Bool {
    let first = findRoot(first)
    let second = findRoot(second)
    guard first != second else { return false }
    roots[second] = first
    return true
}
var result = 0
for cost in costs {
    guard union(cost.from, cost.field) else { continue }
    result += cost.cost
}
print(result)
