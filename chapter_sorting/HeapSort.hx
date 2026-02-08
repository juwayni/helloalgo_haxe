/**
 * File: HeapSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class HeapSort {
    /**
     * Sift down the element at index i in a heap of size n to maintain the max-heap property
     */
    private static function siftDown(nums: Array<Int>, n: Int, i: Int) {
        var curr = i;
        while (true) {
            var l = 2 * curr + 1;
            var r = 2 * curr + 2;
            var ma = curr;
            // Find the largest among current, left child, and right child
            if (l < n && nums[l] > nums[ma]) {
                ma = l;
            }
            if (r < n && nums[r] > nums[ma]) {
                ma = r;
            }
            // If the current node is already the largest, we are done
            if (ma == curr) {
                break;
            }
            // Swap and continue sifting down
            var temp = nums[curr];
            nums[curr] = nums[ma];
            nums[ma] = temp;
            curr = ma;
        }
    }

    /**
     * Perform heap sort on the given array
     */
    public static function heapSort(nums: Array<Int>) {
        var n = nums.length;
        // 1. Build a max-heap from the input array
        var i = Std.int(n / 2) - 1;
        while (i >= 0) {
            siftDown(nums, n, i);
            i--;
        }
        // 2. Iteratively extract the maximum element and rebuild the heap
        var j = n - 1;
        while (j > 0) {
            // Swap the root of the heap with the last element
            var temp = nums[0];
            nums[0] = nums[j];
            nums[j] = temp;
            // Sift down the new root to maintain the heap property in the reduced heap
            siftDown(nums, j, 0);
            j--;
        }
    }

    public static function main() {
        var nums = [4, 1, 3, 1, 5, 2];
        heapSort(nums);
        Sys.println("After heap sort, nums = [" + nums.join(", ") + "]");
    }
}
