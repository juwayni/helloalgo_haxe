/**
 * File: ListNode.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package modules;

class ListNode {
    public var val: Int;
    public var next: ListNode;

    public function new(val: Int = 0, next: ListNode = null) {
        this.val = val;
        this.next = next;
    }

    /**
     * Deserialize a list into a linked list
     */
    public static function listToLinkedList(arr: Array<Int>): ListNode {
        if (arr == null || arr.length == 0) return null;
        var dum = new ListNode(0);
        var head = dum;
        for (a in arr) {
            head.next = new ListNode(a);
            head = head.next;
        }
        return dum.next;
    }

    /**
     * Serialize a linked list into a list
     */
    public static function linkedListToList(head: ListNode): Array<Int> {
        var arr = new Array<Int>();
        var curr = head;
        while (curr != null) {
            arr.push(curr.val);
            curr = curr.next;
        }
        return arr;
    }
}
