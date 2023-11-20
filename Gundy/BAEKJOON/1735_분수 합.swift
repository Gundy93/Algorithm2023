func gcd(_ lhs: Int, _ rhs: Int) -> Int {
    var lhs = lhs
    var rhs = rhs
    var lhsDivisors = [Int: Int]()
    var rhsDivisors = [Int: Int]()
    
    while lhs > 1 {
        for divisor in 2...lhs {
            if lhs % divisor == 0 {
                lhsDivisors[divisor, default: 0] += 1
                lhs /= divisor
                
                break
            }
        }
    }
    
    while rhs > 1 {
        for divisor in 2...rhs {
            if rhs % divisor == 0 {
                rhsDivisors[divisor, default: 0] += 1
                rhs /= divisor
                
                break
            }
        }
    }
    
    let gcd = lhsDivisors.keys.map { Array(repeating: $0, count: min(lhsDivisors[$0]!, rhsDivisors[$0, default: 0])).reduce(1, *) }.reduce(1, *)
    
    return gcd
}

let lhs = readLine()!.split(separator: " ").map { Int($0)! }
let rhs = readLine()!.split(separator: " ").map { Int($0)! }
let numerator = lhs[0] * rhs[1] + rhs[0] * lhs[1]
let denominator = lhs[1] * rhs[1]
let divisor = gcd(numerator, denominator)

print(numerator / divisor, denominator / divisor)
