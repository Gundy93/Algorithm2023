let number = Int(readLine()!)!

stride(from: 1, through: 9, by: 1).forEach { time in
    print("\(number) * \(time) = \(number * time)")
}
