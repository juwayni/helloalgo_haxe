/**
 * File: LinkedList.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_array_and_linkedlist;

import modules.ListNode;
import modules.PrintUtil;

class LinkedList {
    /**
     * Insert node P after node n0 in the linked list
     */
    public static function insert(n0: ListNode, p: ListNode) {
        var n1 = n0.next;
        p.next = n1;
        n0.next = p;
    }

    /**
     * Delete the first node after node n0 in the linked list
     */
    public static function remove(n0: ListNode) {
        if (n0.next == null) {
            return;
        }
        // n0 -> P -> n1
        var p = n0.next;
        var n1 = p.next;
        n0.next = n1;
    }

    /**
     * Access the node at index in the linked list
     */
    public static function access(head: ListNode, index: Int): ListNode {
        var curr = head;
        for (i in 0...index) {
            if (curr == null) {
                return null;
            }
            curr = curr.next;
        }
        return curr;
    }

    /**
     * Search for the first node with value target in the linked list and return its index
     */
    public static function find(head: ListNode, target: Int): Int {
        var curr = head;
        var index = 0;
        while (curr != null) {
            if (curr.val == target) {
                return index;
            }
            curr = curr.next;
            index++;
        }
        return -1;
    }

    public static function main() {
        // Initialize linked list
        // Initialize nodes
        var n0 = new ListNode(1);
        var n1 = new ListNode(3);
        var n2 = new ListNode(2);
        var n3 = new ListNode(5);
        var n4 = new ListNode(4);
        // Build references between nodes
        n0.next = n1;
        n1.next = n2;
        n2.next = n3;
        n3.next = n4;
        Sys.println("Initialized linked list:");
        PrintUtil.printLinkedList(n0);

        // Insert node
        var p = new ListNode(0);
        insert(n0, p);
        Sys.println("Linked list after insertion:");
        PrintUtil.printLinkedList(n0);

        // Delete node
        remove(n0);
        Sys.println("Linked list after deletion:");
        PrintUtil.printLinkedList(n0);

        // Access node
        var node = access(n0, 3);
        if (node != null) {
            Sys.println("Value of node at index 3 in linked list = " + node.val);
        }

        // Search node
        var index = find(n0, 2);
        Sys.println("Index of node with value 2 in linked list = " + index);
    }
}
