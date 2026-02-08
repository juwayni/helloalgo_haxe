/**
 * File: BinarySearch.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

class BinarySearch {
    /**
     * Binary search using double closed interval [0, n-1]
     */
    public static function binarySearch(nums: Array<Int>, target: Int): Int {
        // Initialize left and right pointers
        var i = 0;
        var j = nums.length - 1;
        // Search until the range is empty
        while (i <= j) {
            // Calculate midpoint index m
            var m = i + Std.int((j - i) / 2);
            if (nums[m] < target) {
                // target is in the right half [m+1, j]
                i = m + 1;
            } else if (nums[m] > target) {
                // target is in the left half [i, m-1]
                j = m - 1;
            } else {
                // Found target at index m
                return m;
            }
        }
        // target not found
        return -1;
    }

    /**
     * Binary search using left-closed right-open interval [0, n)
     */
    public static function binarySearchLcro(nums: Array<Int>, target: Int): Int {
        // Initialize left pointer and right boundary
        var i = 0;
        var j = nums.length;
        // Search until the range is empty (i == j)
        while (i < j) {
            // Calculate midpoint index m
            var m = i + Std.int((j - i) / 2);
            if (nums[m] < target) {
                // target is in the range [m+1, j)
                i = m + 1;
            } else if (nums[m] > target) {
                // target is in the range [i, m)
                j = m;
            } else {
                // Found target at index m
                return m;
            }
        }
        // target not found
        return -1;
    }

    public static function main() {
        var target = 6;
        var nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35];

        // Perform binary search (double closed interval)
        var index = binarySearch(nums, target);
        Sys.println("Index of target element 6 = " + index);

        // Perform binary search (left-closed right-open interval)
        index = binarySearchLcro(nums, target);
        Sys.println("Index of target element 6 = " + index);
    }
}
