let NC = readLine()!.split(separator: " ").map { Int($0)! }
var houses = [Int]()

for _ in 1...NC[0] {
    houses.append(Int(readLine()!)!)
}

houses.sort()

var start = 1
var end = houses.last! - houses.first!

while start < end {
    let half = (start + end + 1) / 2
    var current = houses[0]
    var count = 1
    
    for index in 1...NC[0] - 1 {
        if houses[index] - current >= half {
            count += 1
            current = houses[index]
        }
    }
    
    if count >= NC[1] {
        start = half
    } else {
        end = half - 1
    }
}

print(end)
