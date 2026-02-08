/**
 * File: QuickSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class QuickSort {
    /**
     * Standard partition using the leftmost element as the pivot
     */
    private static function partition(nums: Array<Int>, left: Int, right: Int): Int {
        var i = left;
        var j = right;
        while (i < j) {
            // Find the first element smaller than the pivot from right to left
            while (i < j && nums[j] >= nums[left]) {
                j--;
            }
            // Find the first element larger than the pivot from left to right
            while (i < j && nums[i] <= nums[left]) {
                i++;
            }
            // Swap detected elements
            var temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
        }
        // Swap pivot to its final sorted position
        var temp = nums[i];
        nums[i] = nums[left];
        nums[left] = temp;
        return i;
    }

    /**
     * Standard recursive quick sort
     */
    public static function quickSort(nums: Array<Int>, left: Int, right: Int) {
        if (left >= right) return;
        var pivot = partition(nums, left, right);
        quickSort(nums, left, pivot - 1);
        quickSort(nums, pivot + 1, right);
    }

    /**
     * Helper to select the median value among three candidates
     */
    private static function medianThree(nums: Array<Int>, left: Int, mid: Int, right: Int): Int {
        var l = nums[left], m = nums[mid], r = nums[right];
        if ((l <= m && m <= r) || (r <= m && m <= l)) return mid;
        if ((m <= l && l <= r) || (r <= l && l <= m)) return left;
        return right;
    }

    /**
     * Partition using the median-of-three optimization
     */
    private static function partitionMedian(nums: Array<Int>, left: Int, right: Int): Int {
        var mid = Std.int((left + right) / 2);
        var med = medianThree(nums, left, mid, right);
        // Swap median element to the leftmost position to serve as pivot
        var temp = nums[left];
        nums[left] = nums[med];
        nums[med] = temp;

        return partition(nums, left, right);
    }

    /**
     * Quick sort with median-of-three optimization
     */
    public static function quickSortMedian(nums: Array<Int>, left: Int, right: Int) {
        if (left >= right) return;
        var pivot = partitionMedian(nums, left, right);
        quickSortMedian(nums, left, pivot - 1);
        quickSortMedian(nums, pivot + 1, right);
    }

    /**
     * Quick sort with tail call optimization to minimize recursion depth
     */
    public static function quickSortTailCall(nums: Array<Int>, left: Int, right: Int) {
        while (left < right) {
            var pivot = partition(nums, left, right);
            // Recursively sort the smaller sub-array, then loop to sort the larger one
            if (pivot - left < right - pivot) {
                quickSortTailCall(nums, left, pivot - 1);
                left = pivot + 1;
            } else {
                quickSortTailCall(nums, pivot + 1, right);
                right = pivot - 1;
            }
        }
    }

    public static function main() {
        var nums = [2, 4, 1, 0, 3, 5];
        quickSort(nums, 0, nums.length - 1);
        Sys.println("After quick sort, nums = [" + nums.join(", ") + "]");

        var nums1 = [2, 4, 1, 0, 3, 5];
        quickSortMedian(nums1, 0, nums1.length - 1);
        Sys.println("After quick sort (median optimization), nums1 = [" + nums1.join(", ") + "]");

        var nums2 = [2, 4, 1, 0, 3, 5];
        quickSortTailCall(nums2, 0, nums2.length - 1);
        Sys.println("After quick sort (recursion depth optimization), nums2 = [" + nums2.join(", ") + "]");
    }
}
