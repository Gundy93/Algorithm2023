func solution(_ w:Int, _ h:Int) -> Int64{
    return Int64(w * h - w - h + getGCD(w, h))
}

func getGCD(_ a: Int, _ b: Int) -> Int {
    guard b != 0 else { return a }
    return getGCD(b, a % b)
}
