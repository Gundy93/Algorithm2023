let input = readLine()!.split(separator: " ").map { Int($0)! }
var partialsum = [0]

for number in readLine()!.split(separator: " ").map({ Int($0)! }) {
    partialsum.append(partialsum.last! + number)
}

var result = ""

for _ in 0..<input[1] {
    let range = readLine()!.split(separator: " ").map { Int($0)! }
    
    result += String(partialsum[range[1]] - partialsum[range[0] - 1]) + "\n"
}

print(result)
