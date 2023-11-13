var target = Int(readLine()!)!
var row = Int()

for number in 1... {
    target -= number
    
    guard target > 0 else {
        row = number
        
        break
    }
}

target += row

if row % 2 == 1 {
    var result = (row, 1)

    for _ in stride(from: 2, through: target, by: 1) {
        result.0 -= 1
        result.1 += 1
    }

    print("\(result.0)/\(result.1)")
} else {
    var result = (1, row)

    for _ in stride(from: 2, through: target, by: 1) {
        result.0 += 1
        result.1 -= 1
    }

    print("\(result.0)/\(result.1)")
} 
