let count = Int(readLine()!)!
var stars = Array(repeating: Array(repeating: " ", count: count), count: count)

func recursion(_ row: Int, _ column: Int, _ term: Int) {
    guard  term > 1 else {
        stars[row][column] = "*"
        
        return
    }
    
    for x in stride(from: 0, to: term, by: term / 3) {
        for y in stride(from: 0, to: term, by: term / 3) {
            guard (x == term / 3 && y == term / 3) == false else { continue }
            
            recursion(row + x, column + y, term / 3)
        }
    }
}

recursion(0, 0, count)

var result = String()

stars.forEach { result += $0.joined() + "\n" }

print(result)
