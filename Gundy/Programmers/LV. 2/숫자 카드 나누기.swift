func solution(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
    let arrayA = arrayA.sorted()
    let arrayB = arrayB.sorted()
    let gcdA = arrayA.reduce(arrayA[0], { getGCD($0, $1) })
    let gcdB = arrayB.reduce(arrayB[0], { getGCD($0, $1) })
    var result = arrayB.allSatisfy { $0 % gcdA != 0 } ? gcdA : 0
    if arrayA.allSatisfy({ $0 % gcdB != 0 }) {
        result = max(result, gcdB)
    }
    return result
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else { return a }
    return getGCD(b, a % b)
}
