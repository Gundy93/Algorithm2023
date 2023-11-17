/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func reverseBetween(_ head: ListNode?, _ left: Int, _ right: Int) -> ListNode? {
        guard left != right else { return head }

        let previousOfHead = ListNode()
        var current: ListNode? = previousOfHead
        var index = 0
        var nodes = [ListNode]()
        var previous: ListNode? = nil
        var next: ListNode? = nil

        previousOfHead.next = head

        while index <= right {
            if index == left - 1 {
                index += 1
                previous = current
                current = current?.next
                
                while let node = current,
                      index <= right {
                    nodes.append(node)
                    current = current?.next
                    index += 1
                }
                
                next = current
            } else {
                current = current?.next
                index += 1
            }
        }
        
        for index in stride(from: nodes.count - 1, through: 1, by: -1) {
            nodes[index].next = nodes[index - 1]
        }
        
        previous?.next = nodes.last
        nodes.first?.next = next

        return previousOfHead.next
    }
}
