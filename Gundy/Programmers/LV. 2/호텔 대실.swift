import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var bookTimes = book_time.map(toTimes).sorted(by: <)
    var result = 0
    
    while bookTimes.isEmpty == false {
        result += 1
        
        var last = -10
        var stack = [(Int, Int)]()
        
        for bookTime in bookTimes {
            if last+10 > bookTime.0 {
                stack.append(bookTime)
            } else {
                last = bookTime.1
            }
        }
        
        bookTimes = stack
    }
    
    return result
}

func toTimes(_ times: [String]) -> (Int, Int) {
    (toTime(times[0]), toTime(times[1]))
}

func toTime(_ time: String) -> Int {
    let time = time.split(separator: ":").map { Int($0)! }
    
    return time[0]*60 + time[1]
}
