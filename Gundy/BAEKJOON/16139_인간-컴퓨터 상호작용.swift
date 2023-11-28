let text = readLine()!.map(String.init)
let count = Int(readLine()!)!
let converter = ["a":0,"b":1,"c":2,"d":3,"e":4,"f":5,"g":6,"h":7,"i":8,"j":9,"k":10,"l":11,"m":12,"n":13,"o":14,"p":15,"q":16,"r":17,"s":18,"t":19,"u":20,"v":21,"w":22,"x":23,"y":24,"z":25]
var prefixSum = Array(repeating: Array(repeating: 0, count: 26), count: text.count + 1)

for index in stride(from: 0, to: text.count, by: 1) {
    var sum = prefixSum[index]
    let alphabetIndex = converter[text[index]]!
    
    sum[alphabetIndex] += 1
    prefixSum[index + 1] = sum
}

var result = String()

for _ in 1...count {
    let input = readLine()!.split(separator: " ").map(String.init)
    let alphabetIndex = converter[input[0]]!
    
    result += "\(prefixSum[Int(input[2])! + 1][alphabetIndex] - prefixSum[Int(input[1])!][alphabetIndex])\n"
}

print(result)
