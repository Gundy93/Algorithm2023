while let input = readLine(),
      let number = Int(input),
      number != -1 {
    var numbers = [Int]()
    
    for divisor in 1...number / 2 {
        if number % divisor == 0 {
            numbers.append(divisor)
        }
    }
    
    if number == numbers.reduce(0, +) {
        print("\(number) = " + numbers.map(String.init).joined(separator: " + "))
    } else {
        print("\(number) is NOT perfect.")
    }
}
