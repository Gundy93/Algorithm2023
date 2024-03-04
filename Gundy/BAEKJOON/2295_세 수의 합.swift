func solution() {
    let count = Int(readLine()!)!
    var numbers = [Int]()
    
    for _ in 0..<count {
        numbers.append(Int(readLine()!)!)
    }
    
    var sum = Set<Int>()
    
    for first in 0..<count {
        for second in first..<count {
            sum.insert(numbers[first] + numbers[second])
        }
    }
    
    for number in numbers.sorted(by: >) {
        for third in numbers {
            if sum.contains(number - third) {
                print(number)
                return
            }
        }
    }
}

solution()
