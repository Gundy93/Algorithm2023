var number = Int(readLine()!)!

loop: while number > 1 {
    for divisor in 2...number {
        if number % divisor == 0 {
            print(divisor)
            number /= divisor
            
            continue loop
        }
    }
    
    print(number)
    
    break
}
