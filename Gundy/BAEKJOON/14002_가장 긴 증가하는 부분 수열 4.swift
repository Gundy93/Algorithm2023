let count = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
var lis = [numbers[0]]
var indices = [0]

for index in stride(from: 1, to: count, by: 1) {
    if lis.last! < numbers[index] {
        lis.append(numbers[index])
        indices.append(lis.count - 1)
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
        indices.append(end)
    }
}

var lisIndex = lis.count - 1
var result = [Int]()

for index in (0..<count).reversed() {
    if indices[index] == lisIndex {
        result.append(numbers[index])
        
        guard lisIndex > 0 else { break }
        
        lisIndex -= 1
    }
}

print("\(result.count)\n\(result.reversed().map(String.init).joined(separator: " "))")
