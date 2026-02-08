/**
 * File: BinarySearchRecur.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_divide_and_conquer;

class BinarySearchRecur {
    /**
     * Recursive helper function for binary search
     */
    private static function dfs(nums: Array<Int>, target: Int, i: Int, j: Int): Int {
        // Base case: search range is empty
        if (i > j) {
            return -1;
        }
        // Calculate midpoint
        var m = i + Std.int((j - i) / 2);
        if (nums[m] < target) {
            // Search in the right half
            return dfs(nums, target, m + 1, j);
        } else if (nums[m] > target) {
            // Search in the left half
            return dfs(nums, target, i, m - 1);
        } else {
            // Found the target
            return m;
        }
    }

    /**
     * Perform binary search on a sorted array using divide and conquer
     */
    public static function binarySearch(nums: Array<Int>, target: Int): Int {
        var n = nums.length;
        return dfs(nums, target, 0, n - 1);
    }

    public static function main() {
        var target = 6;
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Search for target element 6
        var index = binarySearch(nums, target);
        Sys.println("Index of target element 6 = " + index);
    }
}
