while let numbers = readLine()?.split(separator: " ").compactMap({ Int($0) }),
      numbers != [0, 0] {
    let (lhs, rhs) = (numbers[0], numbers[1])

    print(rhs % lhs == 0 ? "factor" : lhs % rhs == 0 ? "multiple" : "neither")
}
