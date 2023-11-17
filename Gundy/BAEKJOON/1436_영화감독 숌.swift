let target = Int(readLine()!)!
var numbers = [666]

while numbers.count < target,
      let last = numbers.last {
    for number in (last + 1)... {
        if validate(String(number)) {
            numbers.append(number)
            
            break
        }
    }
}

func validate(_ number: String) -> Bool {
    var count = 0
    for word in number {
        if word == "6" {
            count += 1
            
            if count == 3 {
                return true
            }
        } else {
            count = 0
        }
    }
    
    return false
}

print(numbers[numbers.count - 1])
