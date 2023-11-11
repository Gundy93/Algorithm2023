let count = Int(readLine()!)!

stride(from: 1, to: count * 2, by: 1).forEach { row in
    print(String(repeating: " ", count: abs(count - row)) + String(repeating: "*", count: (count - abs(count - row)) * 2 - 1))
}
