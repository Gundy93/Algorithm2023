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
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        var first: ListNode? = nil
        var last: ListNode? = nil
        var current = head
        
        while let node = current {
            current = current?.next

            guard node.val != val else { continue }
            
            node.next = nil
            last?.next = node
            last = node
            
            if first == nil {
                first = node
            }
        }
        
        return first
    }
}
