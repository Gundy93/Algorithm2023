import Foundation

func solution(_ nums:[Int]) -> Int {
    var result = 0
    var primeNumbers = Array(repeating: true, count: 2998)
    
    for number in 2...2997 {
        if primeNumbers[number] {
            for multiple in stride(from: number * number, to: 2998, by: number) {
                primeNumbers[multiple] = false
            }
        }
    }
    
    for first in 0..<nums.count-2 {
        for second in first+1..<nums.count-1 {
            let partialSum = nums[first] + nums[second]
            
            for third in second+1..<nums.count {
                if primeNumbers[partialSum + nums[third]] {
                    result += 1
                }
            }
        }
    }

    return result
}
