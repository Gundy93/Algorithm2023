let _ = readLine()
let divisors = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

print(divisors[0] * divisors[divisors.count - 1])
