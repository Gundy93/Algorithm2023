let point = Int(readLine()!)!
var grade = String()

switch point {
case 90...:
    grade = "A"
case 80...:
    grade = "B"
case 70...:
    grade = "C"
case 60...:
    grade = "D"
default:
    grade = "F"
}

print(grade)
