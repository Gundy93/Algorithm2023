import Foundation

for _ in 0..<Int(readLine()!)! {
    let input = readLine()!.split(separator: " ").map { Double($0)! }
    let powX = pow(input[0] - input[3], 2)
    let powY = pow(input[1] - input[4], 2)
    let distance = powX + powY
    
    if input[2] == input[5],
       distance == 0 {
        print(-1)
    } else if pow(input[2] - input[5], 2) > distance || pow(input[2] + input[5], 2) < distance {
        print(0)
    } else if pow(input[2] - input[5], 2) == distance || pow(input[2] + input[5], 2) == distance {
        print(1)
    } else {
        print(2)
    }
}
