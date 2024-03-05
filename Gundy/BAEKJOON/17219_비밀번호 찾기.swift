let input = readLine()!.split(separator: " ").map { Int($0)! }
var passwords = [String : String]()

for _ in 0..<input[0] {
    let password = readLine()!.split(separator: " ").map(String.init)
    passwords[password[0]] = password[1]
}

var result = ""

for _ in 0..<input[1] {
    let site = readLine()!
    result += passwords[site]! + "\n"
}

print(result)
