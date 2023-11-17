let target = Int(readLine()!)!
var five = target / 5
var three = ((target % 5) + 2) / 3
var lists = Set<[Int]>()
var isValid = true

while five * 5 + three * 3 != target {
    guard lists.contains([five, three]) == false else {
        isValid = false
        
        break
    }
    
    lists.insert([five, three])
    
    if five * 5 + three * 3 > target {
        three -= 1
        
        guard three >= 0 else {
            isValid = false
            
            break
        }
    } else {
        five -= 1
        three += 2
        
        guard five >= 0 else {
            isValid = false
            
            break
        }
    }
}

print(isValid ? five + three : -1)
