/**
 * File: BubbleSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class BubbleSort {
    /**
     * Standard bubble sort algorithm (O(n^2))
     */
    public static function bubbleSort(nums: Array<Int>) {
        var n = nums.length;
        // Outer loop defines the end of the unsorted portion
        var i = n - 1;
        while (i > 0) {
            // Inner loop compares adjacent elements
            for (j in 0...i) {
                if (nums[j] > nums[j + 1]) {
                    // Swap elements if they are in the wrong order
                    var temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                }
            }
            i--;
        }
    }

    /**
     * Bubble sort with flag optimization to stop early if the array is sorted
     */
    public static function bubbleSortWithFlag(nums: Array<Int>) {
        var n = nums.length;
        var i = n - 1;
        while (i > 0) {
            var flag = false;
            for (j in 0...i) {
                if (nums[j] > nums[j + 1]) {
                    var temp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = temp;
                    flag = true;
                }
            }
            // If no swaps occurred, the array is already sorted
            if (!flag) break;
            i--;
        }
    }

    public static function main() {
        var nums = [4, 1, 3, 1, 5, 2];
        bubbleSort(nums);
        Sys.println("After bubble sort, nums = [" + nums.join(", ") + "]");

        var nums1 = [4, 1, 3, 1, 5, 2];
        bubbleSortWithFlag(nums1);
        Sys.println("After bubble sort with flag, nums1 = [" + nums1.join(", ") + "]");
    }
}
