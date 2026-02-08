/**
 * File: SelectionSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class SelectionSort {
    /**
     * Standard selection sort algorithm (O(n^2))
     */
    public static function selectionSort(nums: Array<Int>) {
        var n = nums.length;
        // Outer loop defines the start of the unsorted portion
        for (i in 0...n - 1) {
            // Inner loop searches for the minimum element in the remaining unsorted portion
            var k = i;
            for (j in i + 1...n) {
                if (nums[j] < nums[k]) {
                    k = j;
                }
            }
            // Swap the found minimum element with the first element of the unsorted portion
            var temp = nums[i];
            nums[i] = nums[k];
            nums[k] = temp;
        }
    }

    public static function main() {
        var nums = [4, 1, 3, 1, 5, 2];
        selectionSort(nums);
        Sys.println("After selection sort, nums = [" + nums.join(", ") + "]");
    }
}
