func solution() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var times = Array(repeating: Array(repeating: Int.max, count: input[0]), count: input[0])
    
    for start in 0..<input[0] {
        let costs = readLine()!.split(separator: " ").map { Int($0)! }
        
        for end in 0..<input[0] {
            times[start][end] = min(times[start][end], costs[end])
        }
    }
    
    for mid in 0..<input[0] {
        for start in 0..<input[0] {
            for end in 0..<input[0] {
                times[start][end] = min(times[start][end], times[start][mid] + times[mid][end])
            }
        }
    }
    
    var planetList = Set(0..<input[0])
    var result = Int.max
    
    planetList.remove(input[1])
    
    func recursion(_ planets: [Int]) {
        guard planets.count < input[0]-1 else {
            var sum = times[input[1]][planets[0]]
            
            for index in 0..<planets.count-1 {
                sum += times[planets[index]][planets[index+1]]
            }
            
            result = min(result, sum)
            
            return
        }
        
        for planet in planetList where planets.contains(planet) == false {
            recursion(planets + [planet])
        }
    }
    
    recursion([])
    print(result)
}
    
solution()
