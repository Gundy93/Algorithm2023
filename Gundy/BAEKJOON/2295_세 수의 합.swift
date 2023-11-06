var numbers = [Int]()

for _ in 1...Int(readLine()!)! {
    numbers.append(Int(readLine()!)!)
}

numbers.sort()

var double = [Int]()

for first in 0..<numbers.count - 1 {
    for second in first..<numbers.count - 1 {
        double.append(numbers[first] + numbers[second])
    }
}

double.sort()

var result = 0

for first in 0..<numbers.count {
    for second in 0...first {
        if firstIndex(of: numbers[first] - numbers[second]) != nil,
           result < numbers[first] {
            result = numbers[first]
        }
    }
}

print(result)

func firstIndex(of number: Int) -> Int? {
    var start = 0
    var end = double.count - 1
    while start <= end {
        let half = (start + end) / 2
        if double[half] >= number {
            end = half - 1
        } else {
            start = half + 1
        }
    }
    guard start < double.count else { return nil }
    return double[start] == number ? start : nil
}
