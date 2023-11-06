func solution() {
    let number: String = readLine()!
    var result: [Character : Int] = [:]
    number.forEach {
        var text = $0
        if $0 == "9" {
            text = "6"
        }
        result[text, default: 0] += 1
    }
    if result["6", default: 0] % 2 == 1 {
        result["6", default: 0] += 1
    }
    result["6", default: 0] = result["6", default: 0] / 2
    print(result.values.sorted().last!)
}

solution()
