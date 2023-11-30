let NM = readLine()!.split(separator: " ").map { Int($0)! }
var A = [[Int]]()

for _ in 1...NM[0] {
    A.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let MK = readLine()!.split(separator: " ").map { Int($0)! }
var B = [[Int]]()

for _ in 1...MK[0] {
    B.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var C = Array(repeating: Array(repeating: 0, count: MK[1]), count: NM[0])

for n in 0...NM[0] - 1 {
    for k in 0...MK[1] - 1 {
        for m in 0...NM[1] - 1 {
            C[n][k] += A[n][m] * B[m][k]
        }
    }
}

var result = String()

for row in C {
    result += row.map(String.init).joined(separator: " ") + "\n"
}

print(result)
