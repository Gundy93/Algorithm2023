let MAX = 99999999
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (N, M) = (input[0], input[1])
var buses = [(Int, Int, Int)]()
var distance = Array(repeating: MAX, count: N + 1)
var isLoop = false
var result = String()

for _ in 1...M {
    let bus = readLine()!.split(separator: " ").map { Int($0)! }
    
    buses.append((bus[0], bus[1], bus[2]))
}

distance[1] = 0

for _ in 1...N - 1 {
    for (start, end, time) in buses {
        if distance[start] != MAX,
           distance[start] + time < distance[end] {
            distance[end] = distance[start] + time
        }
    }
}

for (start, end, time) in buses {
    if distance[start] != MAX,
       distance[start] + time < distance[end] {
        isLoop = true
        
        break
    }
}

if isLoop {
    result = "-1"
} else {
    for index in stride(from: 2, through: N, by: 1) {
        result += "\(distance[index] == MAX ? -1 : distance[index])\n"
    }
}

print(result)
