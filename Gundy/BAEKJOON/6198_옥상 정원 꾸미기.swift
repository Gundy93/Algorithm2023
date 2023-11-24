let numberOfBuildings = Int(readLine()!)!
var stack = [Int]()
var result = 0

for _ in 1...numberOfBuildings {
    let building = Int(readLine()!)!
    
    while let last = stack.last,
          last <= building {
        stack.removeLast()
        result += stack.count
    }
    
    stack.append(building)
}

while let last = stack.popLast() {
    result += stack.count
}

print(result)
