func solution() {
    let times: Int = Int(readLine()!)!
    for _ in 1...times {
        let texts: [String] = readLine()!.split(separator: " ").map({ String($0.sorted()) })
        if texts[0] == texts[1] {
            print("Possible")
        } else {
            print("Impossible")
        }
    }
}

solution()
