let (a, b, c) = (Int(readLine()!)!, Int(readLine()!)!, Int(readLine()!)!)
let number = a * b * c
let target = String(number).compactMap { Int(String($0)) }
var counter = [Int: Int]()

target.forEach { counter[$0, default: 0] += 1 }
stride(from: 0, through: 9, by: 1).forEach { print(counter[$0, default: 0]) }
