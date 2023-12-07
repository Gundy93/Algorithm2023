let count = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").map { Int($0)! }
let _ = readLine()
let balls = readLine()!.split(separator: " ").map { Int($0)! }
var canCheck = Array(repeating: Array(repeating: false, count: 15005), count: count + 1)
var needCheck = [(index: 0, weight: 0)]

while needCheck.isEmpty == false {
    let current = needCheck.removeLast()
    
    guard canCheck[current.index][current.weight] == false else { continue }
    
    canCheck[current.index][current.weight] = true
    
    guard current.index < count else { continue }
    
    needCheck.append((current.index + 1, current.weight + weights[current.index]))
    needCheck.append((current.index + 1, current.weight))
    needCheck.append((current.index + 1, abs(current.weight - weights[current.index])))
}

print(balls.map { $0 <= 15000 && canCheck[count][$0] ? "Y" : "N" }.joined(separator: " "))
