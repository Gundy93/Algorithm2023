var xCounter = [Int: Int]()
var yCounter = [Int: Int]()

for _ in 1...3 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    
    xCounter[input[0], default: 0] += 1
    yCounter[input[1], default: 0] += 1
}

let x = xCounter.keys.filter { xCounter[$0] == 1 }[0]
let y = yCounter.keys.filter { yCounter[$0] == 1 }[0]

print(x, y)
