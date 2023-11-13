var target = Int(readLine()!)! - 1
var result = 1

while target > 0 {
    target -= result * 6
    result += 1
}

print(result)
