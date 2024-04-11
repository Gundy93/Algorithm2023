import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var lastEnter = [String : Int]()
    var times = [String : Int]()
    
    for record in records {
        let input = record.split(separator: " ").map(String.init)
        let time = input[0].split(separator: ":").map { Int($0)! }
        let minute = time[0]*60 + time[1]
        
        if input[2] == "IN" {
            lastEnter[input[1]] = minute
        } else {
            times[input[1], default: 0] += minute - lastEnter[input[1]]!
            lastEnter[input[1]] = nil
        }
    }
    
    for car in lastEnter {
        let minute = 23*60 + 59
        
        times[car.key, default: 0] += minute - car.value
    }
    
    let cars = times.keys.sorted()
    
    return cars.map { fees[1] + max(0, (times[$0]! - fees[0] + fees[2] - 1)/fees[2])*fees[3] }
}
