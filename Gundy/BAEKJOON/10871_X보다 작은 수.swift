let target = readLine()!.split(separator: " ").compactMap { Int(String($0)) }[1]
let result = readLine()!.split(separator: " ").map(String.init).filter { Int($0)! < target }.joined(separator: " ")

print(result)
