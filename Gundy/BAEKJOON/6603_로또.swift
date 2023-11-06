while let input = readLine(),
      input != "0" {
    let numbers = input.split(separator: " ").compactMap({ Int($0) })
    func recursion(_ pick: [Int], current index: Int) {
        guard pick.count < 6 else {
            print(pick.map(String.init).joined(separator: " "))
            return
        }
        guard index < numbers.count else {
            return
        }
        recursion(pick + [numbers[index]], current: index + 1)
        recursion(pick, current: index + 1)
    }
    recursion([], current: 1)
    print()
}
