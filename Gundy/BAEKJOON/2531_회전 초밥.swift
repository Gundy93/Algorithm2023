let input = readLine()!.split(separator: " ").map { Int($0)! }
var sushis = [Int]()

for _ in 0..<input[0] {
    sushis.append(Int(readLine()!)!)
}

sushis += sushis

var start = 0
var end = 0
var result = 1
var count = 1
var counter = Array(repeating: 0, count: input[1]+1)

counter[sushis[0]] = 1

while end < sushis.count-1,
      start < input[0] {
    end += 1
    counter[sushis[end]] += 1
            
    if counter[sushis[end]] == 1 {
        count += 1
    }

    if end - start + 1 > input[2] {
        counter[sushis[start]] -= 1
        
        if counter[sushis[start]] == 0 {
            count -= 1
        }
        
        start += 1
    }
    
    result = max(result, counter[input[3]] == 0 ? count + 1 : count)
}

print(result)
