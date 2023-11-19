let input = readLine()!.split(separator: " ").map { Int($0)! }
var list = Set<String>()

for _ in 1...input[0] {
    list.insert(readLine()!)
}

var result = 0

for _ in 1...input[1] {
    if list.contains(readLine()!) {
        result += 1
    }
}

print(result)
