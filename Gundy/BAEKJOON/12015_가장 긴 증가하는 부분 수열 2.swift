let count = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var lis = [numbers[0]]

for index in stride(from: 1, to: count, by: 1) {
    if lis.last! < numbers[index] {
        lis.append(numbers[index])
    } else {
        var start = 0
        var end = lis.count - 1
        
        while start < end {
            let half = (start + end) / 2
            
            if lis[half] < numbers[index] {
                start = half + 1
            } else {
                end = half
            }
        }
        
        lis[end] = numbers[index]
    }
}

print(lis.count)
