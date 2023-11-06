struct Stack<DataType> {
    private(set) var values: [DataType] = []
    
    mutating func push(_ value: DataType) {
        values.append(value)
    }
    
    mutating func pop() -> DataType? {
        return values.popLast()
    }
}

func solution() {
    var stack = Stack<Int>()
    var numbers: [Int] = []
    var numberSequence: [Int] = []
    var result: [String] = []
    let size = Int(readLine()!)!

    for number in 1...size {
        numbers.append(number)
        numberSequence.append(Int(readLine()!)!)
    }
    numbers = numbers.reversed()
    
    for number in numberSequence {
        while stack.values.contains(number) == false {
            guard let last = numbers.popLast() else {
                print("NO")
                return
            }
            stack.push(last)
            result.append("+")
        }
        guard let value = stack.pop(),
              value == number else {
            print("NO")
            return
        }
        result.append("-")
    }
    
    for text in result {
        print(text)
    }
}

solution()
