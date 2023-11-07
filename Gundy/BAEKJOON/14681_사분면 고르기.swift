let x = Int(readLine()!)!
let y = Int(readLine()!)!

print(x > 0 && y > 0 ? 1 : x < 0 && y > 0 ? 2 : x < 0 && y < 0 ? 3 : 4)
