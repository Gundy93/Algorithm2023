let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var (lhs, rhs) = (numbers[0], numbers[1])
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

let lcm = Set(lhsDivisors.keys).union(rhsDivisors.keys).map {
    return Array(repeating: $0, count: max(lhsDivisors[$0, default: 0], rhsDivisors[$0, default: 0])).reduce(1, *)
}

print(lcm.reduce(1, *))
