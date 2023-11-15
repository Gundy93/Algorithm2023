while let sides = readLine()?.split(separator: " ").compactMap({ Int($0) }).sorted(),
      sides != [0, 0, 0] {
    var counter = [Int: Int]()
    
    sides.forEach { side in
        counter[side, default: 0] += 1
    }
    
    switch counter.keys.count {
    case 1:
        print("Equilateral")
    case 2:
        print(sides[2] < sides[0] + sides[1] ? "Isosceles" : "Invalid")
    default:
        print(sides[2] < sides[0] + sides[1] ? "Scalene" : "Invalid")
    }
}
