let numbers = readLine()!.split(separator: " ").compactMap({ Int($0) })

let numerator = stride(from: 1, through: numbers[0], by: 1).reduce(1, *)
let denominator = stride(from: 1, through: numbers[0] - numbers[1], by: 1).reduce(1, *) * stride(from: 1, through: numbers[1], by: 1).reduce(1, *)

print(numerator / denominator)
