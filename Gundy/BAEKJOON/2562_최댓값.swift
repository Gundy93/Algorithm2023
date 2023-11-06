func solution() {
    var result: Int = 0
    var index: Int = 0
    for time in 1...9 {
        let number: Int = Int(readLine()!)!
        if number > result {
            result = number
            index = time
        }
    }
    print(result)
    print(index)
}

solution()
