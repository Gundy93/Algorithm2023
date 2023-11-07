let time = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var (hour, minute) = (time[0], time[1])
let needTime = Int(readLine()!)!

minute += needTime

if minute / 60 > 0 {
    hour += minute / 60
    minute %= 60
}

hour %= 24

print(hour, minute)
