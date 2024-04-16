import Foundation

func solution(_ record:[String]) -> [String] {
    let records = record.map { $0.split(separator: " ").map(String.init) }
    var nickName = [String : String]()
    var result = [[String]]()
    
    for record in records {
        if record.count > 2 { nickName[record[1]] = record[2] }
        
        guard record[0] != "Change" else { continue }
        
        result.append([record[1], record[0]])
    }
    
    return result.map {
        var result = nickName[$0[0]]!
        
        switch $0[1] {
        case "Enter":
            result += "님이 들어왔습니다."
        case "Leave":
            result += "님이 나갔습니다."
        default:
            break
        }
        
        return result
    }
}
