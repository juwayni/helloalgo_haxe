/**
 * File: BinarySearchInsertion.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

class BinarySearchInsertion {
    /**
     * Find insertion point for target in a sorted array without duplicates
     */
    public static function binarySearchInsertionSimple(nums: Array<Int>, target: Int): Int {
        var i = 0;
        var j = nums.length - 1; // Double closed interval [0, n-1]
        while (i <= j) {
            var m = i + Std.int((j - i) / 2); // Midpoint
            if (nums[m] < target) {
                i = m + 1; // target is in [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target is in [i, m-1]
            } else {
                return m; // target found, insertion point is m
            }
        }
        // target not found, i is the correct insertion index
        return i;
    }

    /**
     * Find the leftmost insertion point for target in a sorted array with potential duplicates
     */
    public static function binarySearchInsertion(nums: Array<Int>, target: Int): Int {
        var i = 0;
        var j = nums.length - 1;
        while (i <= j) {
            var m = i + Std.int((j - i) / 2);
            if (nums[m] < target) {
                i = m + 1; // target is in [m+1, j]
            } else if (nums[m] > target) {
                j = m - 1; // target is in [i, m-1]
            } else {
                // target found, but we want the leftmost index, so search left
                j = m - 1;
            }
        }
        // i will point to the first element >= target
        return i;
    }

    public static function main() {
        // Test case 1: No duplicate elements
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];
        Sys.println("\nArray nums = [" + nums.join(", ") + "]");
        var targets = [6, 9];
        for (target in targets) {
            var index = binarySearchInsertionSimple(nums, target);
            Sys.println("Insertion point for element " + target + " is index " + index);
        }

        // Test case 2: Duplicate elements exist
        nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15];
        Sys.println("\nArray nums = [" + nums.join(", ") + "]");
        var targets2 = [2, 6, 20];
        for (target in targets2) {
            var index = binarySearchInsertion(nums, target);
            Sys.println("Insertion point for element " + target + " is index " + index);
        }
    }
}
