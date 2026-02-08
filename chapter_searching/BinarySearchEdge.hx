/**
 * File: BinarySearchEdge.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

import chapter_searching.BinarySearchInsertion;

class BinarySearchEdge {
    /**
     * Binary search to find the index of the leftmost occurrence of target
     */
    public static function binarySearchLeftEdge(nums: Array<Int>, target: Int): Int {
        // Use the insertion point algorithm to find the leftmost index
        var i = BinarySearchInsertion.binarySearchInsertion(nums, target);
        // If index is valid and matches target, return it; otherwise return -1
        if (i == nums.length || nums[i] != target) {
            return -1;
        }
        return i;
    }

    /**
     * Binary search to find the index of the rightmost occurrence of target
     */
    public static function binarySearchRightEdge(nums: Array<Int>, target: Int): Int {
        // Finding the rightmost target is equivalent to finding the insertion point of (target + 1) minus 1
        var i = BinarySearchInsertion.binarySearchInsertion(nums, target + 1);
        var j = i - 1;
        // If index is valid and matches target, return it; otherwise return -1
        if (j == -1 || nums[j] != target) {
            return -1;
        }
        return j;
    }

    public static function main() {
        // Example array with multiple occurrences of the same values
        var nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Sys.println("\nArray nums = [" + nums.join(", ") + "]");

        // Test search for values 6 and 7
        var targets = [6, 7];
        for (target in targets) {
            var index = binarySearchLeftEdge(nums, target);
            Sys.println("Index of the leftmost element " + target + " is " + index);
            index = binarySearchRightEdge(nums, target);
            Sys.println("Index of the rightmost element " + target + " is " + index);
        }
    }
}
