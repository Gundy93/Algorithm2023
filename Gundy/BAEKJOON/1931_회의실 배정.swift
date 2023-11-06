struct Meeting {

    let start: Int
    let end: Int
}

let numberOfMeetings = Int(readLine()!)!
let meetings: [Meeting] = {
    var meetings = [Meeting]()

    for _ in 1...numberOfMeetings {
        let times = readLine()!.split(separator: " ").compactMap({ Int($0) })

        meetings.append(Meeting(start: times[0], end: times[1]))
    }

    return meetings.sorted {
        if $0.end == $1.end {
            return $0.start < $1.start
        }
        return $0.end < $1.end
    }
}()

var result = 1
var currentMeeting = meetings[0]

for index in 1..<numberOfMeetings {
    guard currentMeeting.end <= meetings[index].start else { continue }
    result += 1
    currentMeeting = meetings[index]
}

print(result)
