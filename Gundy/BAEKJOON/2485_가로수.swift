func gcd(_ lhs: Int, _ rhs: Int) -> Int {
    var lhs = lhs
    var rhs = rhs
    var divisors = [Int: Int]()
    
    loop: while lhs > 1 && rhs > 1 {
        for divisor in 2...min(lhs, rhs) {
            if lhs % divisor == 0,
               rhs % divisor == 0 {
                divisors[divisor, default: 0] += 1
                lhs /= divisor
                rhs /= divisor
                
                continue loop
            }
        }
        
        break
    }
    
    let gcd = divisors.keys.map { Array(repeating: $0, count: divisors[$0]!).reduce(1, *) }.reduce(1, *)
    
    return gcd
}

let numberOfTrees = Int(readLine()!)!
var trees = [Int]()

for _ in 1...numberOfTrees {
    trees.append(Int(readLine()!)!)
}

var distances = Set<Int>()

for index in 0...numberOfTrees - 2 {
    distances.insert(trees[index + 1] - trees[index])
}

var numbers = distances.sorted()
var divisor = numbers[0]

for index in stride(from: 1, through: numbers.count - 1, by: 1) {
    guard numbers[index] % divisor != 0 else { continue }
    
    divisor = gcd(divisor, numbers[index])
}

let result = (trees[trees.count - 1] - trees[0]) / divisor + 1 - numberOfTrees

print(result)
