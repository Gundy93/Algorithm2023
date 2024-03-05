let count = Int(readLine()!)!
var result = ""

for _ in 0..<count {
    let count = Int(readLine()!)!
    
    guard count > 0 else {
        result += "0\n"
        continue
    }
    
    var clothesCount = [String : Int]()
    
    for _ in 0..<count {
        let clothes = readLine()!.split(separator: " ").map(String.init)
        clothesCount[clothes[1], default: 1] += 1
    }
    
    result += String(clothesCount.values.reduce(1, *)-1) + "\n"
}

print(result)
