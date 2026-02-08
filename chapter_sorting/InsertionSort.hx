/**
 * File: InsertionSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class InsertionSort {
    /**
     * Standard insertion sort algorithm (O(n^2))
     */
    public static function insertionSort(nums: Array<Int>) {
        // Outer loop starts from the second element
        for (i in 1...nums.length) {
            var base = nums[i];
            var j = i - 1;
            // Inner loop shifts elements to the right to make space for the base element
            while (j >= 0 && nums[j] > base) {
                nums[j + 1] = nums[j];
                j--;
            }
            // Insert the base element at its correct sorted position
            nums[j + 1] = base;
        }
    }

    public static function main() {
        var nums = [4, 1, 3, 1, 5, 2];
        insertionSort(nums);
        Sys.println("After insertion sort, nums = [" + nums.join(", ") + "]");
    }
}
