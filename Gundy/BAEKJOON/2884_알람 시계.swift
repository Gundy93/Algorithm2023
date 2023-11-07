let time = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var (hour, minute) = (time[0], time[1])

if minute < 45 {
    hour -= 1
    if hour < 0 {
        hour = 23
    }
    minute = 60 - abs(minute - 45)
} else {
    minute -= 45
}

print(hour, minute)
