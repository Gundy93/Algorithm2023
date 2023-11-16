let count = Int(readLine()!)! - 2

if count > 0 {
    let result = Array(1...count).map {
        guard $0 > 1 else { return $0 }
        if $0 % 2 == 0 {
            return (1 + $0) * $0 / 2 
        } else {
            return (1 + $0 - 1) * ($0 - 1) / 2 + $0
        }
    }.reduce(0, +)
    
    print(result, 3, terminator: "\n")
} else {
    print(0, 3, terminator: "\n")
}
