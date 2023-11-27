let count = Int(readLine()!)!
var lines = [[Int]]()

for _ in 1...count {
    lines.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let numbers = lines.sorted { $0[0] < $1[0] }.map { $0[1] }
var dp = Array(repeating: 1, count: count)

for index in stride(from: 1, to: count, by: 1) {
    if let max = Array(0...index - 1).filter({ numbers[$0] < numbers[index] }).map({ dp[$0] }).max() {
        dp[index] = max + 1
    }
}

print(count - dp.max()!)
