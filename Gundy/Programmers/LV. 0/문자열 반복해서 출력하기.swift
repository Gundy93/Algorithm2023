let inp = readLine()!.split(separator: " ").map(String.init)
let (s1, a) = (inp[0], Int(inp[1])!)
print(Array(repeating: s1, count: a).joined())
