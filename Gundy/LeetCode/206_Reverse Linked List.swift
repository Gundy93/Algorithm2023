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
    func reverseList(_ head: ListNode?) -> ListNode? {
        var preNode = head
        var currentNode = head?.next

        preNode?.next = nil

        while let nextNode = currentNode?.next {
            currentNode?.next = preNode
            preNode = currentNode
            currentNode = nextNode
        }

        currentNode?.next = preNode

        return currentNode ?? preNode
    }
}
