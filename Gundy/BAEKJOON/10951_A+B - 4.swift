var input = readLine()

while let current = input {
    let numbers = current.split(separator: " ").compactMap { Int(String($0)) }
    
    print(numbers[0] + numbers[1])
    
    input = readLine()
}
