let count = Int(readLine()!)!
var guitars = [(String, Int)]()

for _ in 1...count {
    let guitar = readLine()!
    let sum = guitar.map(String.init).compactMap(Int.init).reduce(0, +)
    guitars.append((guitar, sum))
}

print(guitars.sorted { $0.0.count != $1.0.count ? $0.0.count < $1.0.count : $0.1 != $1.1 ? $0.1 < $1.1 : $0.0 < $1.0 }.map { $0.0 }.joined(separator: "\n"))
