let input = readLine()!.split(separator: " ").map { Int($0)! }
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var tmp = Array(repeating: -1, count: input[0])
var count = 0
var result = -1

func mergeSort(_ numbers: inout [Int], _ p: Int, _ r: Int) {
    if p < r {
        let q = (p + r) / 2
        
        mergeSort(&numbers, p, q)
        mergeSort(&numbers, q + 1, r)
        merge(&numbers, p, q, r)
    }
}

func merge(_ numbers: inout [Int], _ p: Int, _ q: Int, _ r: Int) {
    var i = p, j = q + 1, t = 0
    
    while i <= q && j <= r {
        if numbers[i] <= numbers[j] {
            tmp[t] = numbers[i]
            t += 1
            i += 1
        } else {
            tmp[t] = numbers[j]
            t += 1
            j += 1
        }
    }
    
    while i <= q {
        tmp[t] = numbers[i]
        t += 1
        i += 1
    }
    
    while j <= r {
        tmp[t] = numbers[j]
        t += 1
        j += 1
    }
    
    i = p
    t = 0
    
    while i <= r {
        count += 1
        if count == input[1] {
            result = tmp[t]
            break
        }
        numbers[i] = tmp[t]
        i += 1
        t += 1
    }
}

mergeSort(&numbers, 0, numbers.count - 1)
print(result)
