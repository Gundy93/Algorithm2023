func solution(_ ineq:String, _ eq:String, _ n:Int, _ m:Int) -> Int {
    var isValid = Bool()
    switch (ineq, eq) {
    case (">", "="):
        isValid = n >= m
    case ("<", "="):
        isValid = n <= m
    case (">", "!"):
        isValid = n > m
    default:
        isValid = n < m
    }
    return isValid ? 1 : 0
}
