let numberOfCards = Int(readLine()!)!
var numbers = Array(1...numberOfCards)
var last = 1

while numbers.count > 1 {
    let indices = Array(stride(from: last, to: numbers.count, by: 2))
    
    if numbers.count % 2 == 1 {
        last = 1 - last
    }
    
    numbers = indices.map { numbers[$0] }
}

print(numbers.first!)
