/**
 * File: LinearSearch.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

import modules.ListNode;

class LinearSearch {
    /**
     * Perform linear search on an array
     */
    public static function linearSearchArray(nums: Array<Int>, target: Int): Int {
        // Iterate through each element in the array
        for (i in 0...nums.length) {
            // If match is found, return the index
            if (nums[i] == target) {
                return i;
            }
        }
        // Target not found
        return -1;
    }

    /**
     * Perform linear search on a linked list
     */
    public static function linearSearchLinkedList(head: ListNode, target: Int): ListNode {
        // Traverse the linked list starting from head
        var curr = head;
        while (curr != null) {
            // If node's value matches target, return the node
            if (curr.val == target) {
                return curr;
            }
            curr = curr.next;
        }
        // Target not found
        return null;
    }

    public static function main() {
        var target = 3;

        // Part 1: Linear search in an array
        var nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        var index = linearSearchArray(nums, target);
        Sys.println("Index of target element 3 = " + index);

        // Part 2: Linear search in a linked list
        var head = ListNode.listToLinkedList(nums);
        var node = linearSearchLinkedList(head, target);
        var resStr = (node != null ? Std.string(node.val) : "null");
        Sys.println("Target node with value 3: " + resStr);
    }
}
