import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reports = [String : Set<String>]()
    
    for report in report {
        let ids = report.split(separator: " ").map(String.init)
        
        reports[ids[1], default: []].insert(ids[0])
    }
    
    var mailCounts = [String : Int]()
    
    for report in reports {
        if report.value.count >= k {
            for id in report.value {
                mailCounts[id, default: 0] += 1
            }
        }
    }
    
    return id_list.map { mailCounts[$0, default: 0] }
}
