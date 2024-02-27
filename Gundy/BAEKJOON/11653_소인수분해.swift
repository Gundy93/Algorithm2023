var input = Int(readLine()!)!
var divisors = [String]()

for divisor in 2... {
    guard divisor <= input else { break }
    
    while input % divisor == 0 {
        input /= divisor
        divisors.append(String(divisor))
    }
}


print(divisors.joined(separator: "\n"))
