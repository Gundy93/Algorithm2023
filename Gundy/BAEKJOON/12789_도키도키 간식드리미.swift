let count = Int(readLine()!)!
var stack = [Int]()
var tickets = Array(readLine()!.split(separator: " ").map { Int($0)! }.reversed())
var number = 1
var isValid = true

while number <= count {
    if let last = stack.last,
       last == number {
        stack.removeLast()
        number += 1
    } else if let last = tickets.last,
              last == number {
        tickets.removeLast()
        number += 1
    } else {
        guard let last = tickets.popLast() else {
            isValid = false
            
            break
        }
        
        stack.append(last)
    }
}

print(isValid ? "Nice" : "Sad")
