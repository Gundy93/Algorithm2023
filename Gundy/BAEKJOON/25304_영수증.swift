var totalPrice = Int(readLine()!)!
let number = Int(readLine()!)!

stride(from: 1, through: number, by: 1).forEach { _ in
    let bought = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
    
    totalPrice -= bought[0] * bought[1]
}

print(totalPrice == 0 ? "Yes" : "No")
