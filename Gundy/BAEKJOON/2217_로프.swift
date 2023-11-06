typealias Rope = Int

let numberOfRopes = Int(readLine()!)!
let ropes: [Rope] = {
    var ropes = [Rope]()

    for _ in 1...numberOfRopes {
        ropes.append(Rope(readLine()!)!)
    }

    return ropes.sorted()
}()
var result = 0

for index in 0..<numberOfRopes {
    let totalStrength = (numberOfRopes - index) * ropes[index]
    if result < totalStrength {
        result = totalStrength
    }
}

print(result)
