let _ = readLine()
let listA = Set(readLine()!.split(separator: " ").map(String.init))
let listB = Set(readLine()!.split(separator: " ").map(String.init))
let union = listA.union(listB)
let intersection = listA.intersection(listB)

print(union.subtracting(intersection).count)
