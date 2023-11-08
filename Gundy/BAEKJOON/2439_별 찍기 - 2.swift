let times = Int(readLine()!)!

stride(from: 1, through: times, by: 1).forEach { time in
    print(Array(repeating: " ", count: times - time).joined() + Array(repeating: "*", count: time).joined())
}
