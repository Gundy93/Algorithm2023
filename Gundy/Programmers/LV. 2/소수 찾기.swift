import Foundation

func solution(_ numbers:String) -> Int {
    let maxNumber = String(numbers.sorted(by: >))
    var isPrime = Array(repeating: true, count: Int(maxNumber)!+1)
    
    for number in 2..<isPrime.count {
        if isPrime[number] {
            for multiple in stride(from: number * number, to: isPrime.count, by: number) {
                isPrime[multiple] = false
            }
        }
    }
    
    isPrime[0] = false
    isPrime[1] = false
    
    let numbers = numbers.map(String.init)
    var result = Set<Int>()
    
    func recursion(_ indices: Set<Int>, _ number: String) {
        if let number = Int(number),
           isPrime[number] {
            result.insert(number)
        }
        
        if indices.count == numbers.count { return }
        
        for index in 0..<numbers.count where indices.contains(index) == false {
            var indices = indices
            
            indices.insert(index)
            recursion(indices, number + numbers[index])
        }
    }
    
    recursion([], "")
    
    return result.count
}
