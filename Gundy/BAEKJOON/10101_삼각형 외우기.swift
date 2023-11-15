var angles = [Int: Int]()

for _ in 1...3 {
    angles[Int(readLine()!)!, default: 0] += 1
}

let result = angles.keys.map { ($0, angles[$0]!) }.sorted { $0.1 < $1.1 }

switch result.count {
case 1:
    print(result[0].0 == 60 ? "Equilateral" : "Error")
case 2:
    print(result[0].0 + result[1].0 * 2 == 180 ? "Isosceles" : "Error")
default:
    print(result.map { $0.0 }.reduce(0, +) == 180 ? "Scalene" : "Error")
}
