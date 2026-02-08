/**
 * File: HashingSearch.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

import modules.ListNode;

class HashingSearch {
    /**
     * Perform search using a hash map for O(1) average lookup time (Array input)
     */
    public static function hashingSearchArray(hmap: Map<Int, Int>, target: Int): Int {
        // Retrieve index from map; return -1 if not found
        if (hmap.exists(target)) {
            return hmap.get(target);
        }
        return -1;
    }

    /**
     * Perform search using a hash map for O(1) average lookup time (Linked list nodes)
     */
    public static function hashingSearchLinkedList(hmap: Map<Int, ListNode>, target: Int): ListNode {
        // Retrieve node from map; return null if not found
        return hmap.get(target);
    }

    public static function main() {
        var target = 3;

        // Part 1: Hashing search in an array context
        var nums = [1, 5, 3, 2, 4, 7, 5, 9, 10, 8];
        // Build the hash map mapping element values to their indices
        var map0 = new Map<Int, Int>();
        for (i in 0...nums.length) {
            map0.set(nums[i], i);
        }
        var index = hashingSearchArray(map0, target);
        Sys.println("Index of target element 3 = " + index);

        // Part 2: Hashing search in a linked list context
        var head = ListNode.listToLinkedList(nums);
        // Build the hash map mapping node values to node objects
        var map1 = new Map<Int, ListNode>();
        var curr = head;
        while (curr != null) {
            map1.set(curr.val, curr);
            curr = curr.next;
        }
        var node = hashingSearchLinkedList(map1, target);
        var resStr = (node != null ? Std.string(node.val) : "null");
        Sys.println("Target node with value 3: " + resStr);
    }
}
