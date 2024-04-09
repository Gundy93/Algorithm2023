func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for _ in 0..<input[1] {
        _ = readLine()
    }
    
    print(input[0]-1)
}

for _ in 0..<Int(readLine()!)! {
    solution()
}
