let numbers = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let (a, b, c) = (numbers[0], numbers[1], numbers[2])

print((a + b) % c)
print(((a % c) + (b % c)) % c)
print((a * b) % c)
print(((a % c) * (b % c)) % c)
