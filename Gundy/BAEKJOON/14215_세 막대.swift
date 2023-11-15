var sides = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()

if sides[0] + sides[1] > sides[2] {
    print(sides.reduce(0, +))
} else {
    while sides[0] + sides[1] <= sides[2] {
        sides[2] -= 1
    }
    
    print(sides.reduce(0, +))
}
