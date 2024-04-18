func solution(_ n:Int) -> String {
    var watermelon = Array(repeating: "수박", count: (n+1)/2).joined()
    
    return n % 2 == 1 ? String(watermelon.dropLast()) : watermelon
}
