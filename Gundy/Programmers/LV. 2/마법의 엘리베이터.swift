func solution(_ storey:Int) -> Int {
    var storey = storey
    var result = 0
    while storey > 0 {
        let number = storey % 10
        if number >= 6 || number == 5 && (storey / 10) % 10 >= 5 {
            result += 10 - number
            storey = storey / 10 + 1
        } else {
            result += number
            storey /= 10
        }
    }
    return result
}
