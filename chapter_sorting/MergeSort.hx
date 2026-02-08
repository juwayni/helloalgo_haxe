/**
 * File: MergeSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class MergeSort {
    /**
     * Merge two sorted sub-arrays: [left, mid] and [mid + 1, right]
     */
    private static function merge(nums: Array<Int>, left: Int, mid: Int, right: Int) {
        // Create a temporary array to store the merged result
        var tmp = new Array<Int>();
        var i = left;
        var j = mid + 1;

        // Compare elements from both sub-arrays and copy the smaller one
        while (i <= mid && j <= right) {
            if (nums[i] <= nums[j]) {
                tmp.push(nums[i]);
                i++;
            } else {
                tmp.push(nums[j]);
                j++;
            }
        }

        // Copy any remaining elements from the left sub-array
        while (i <= mid) {
            tmp.push(nums[i]);
            i++;
        }
        // Copy any remaining elements from the right sub-array
        while (j <= right) {
            tmp.push(nums[j]);
            j++;
        }

        // Copy merged elements back into the original array
        for (k in 0...tmp.length) {
            nums[left + k] = tmp[k];
        }
    }

    /**
     * Recursive merge sort algorithm (O(n log n))
     */
    public static function mergeSort(nums: Array<Int>, left: Int, right: Int) {
        // Base case: sub-array length is 1 or less
        if (left >= right) {
            return;
        }
        // Divide: calculate midpoint
        var mid = Std.int((left + right) / 2);
        // Conquer: sort both halves
        mergeSort(nums, left, mid);
        mergeSort(nums, mid + 1, right);
        // Combine: merge the sorted halves
        merge(nums, left, mid, right);
    }

    public static function main() {
        var nums = [7, 3, 2, 6, 0, 1, 5, 4];
        mergeSort(nums, 0, nums.length - 1);
        Sys.println("After merge sort, nums = [" + nums.join(", ") + "]");
    }
}
