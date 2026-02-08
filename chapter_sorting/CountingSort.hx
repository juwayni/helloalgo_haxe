/**
 * File: CountingSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class CountingSort {
    /**
     * Simple counting sort (not stable)
     */
    public static function countingSortNaive(nums: Array<Int>) {
        if (nums.length == 0) return;
        // 1. Find the maximum element m to determine the counter range
        var m = nums[0];
        for (num in nums) {
            if (num > m) m = num;
        }
        // 2. Count occurrences of each number
        var counter = new Array<Int>();
        for (i in 0...m + 1) counter.push(0);
        for (num in nums) {
            counter[num]++;
        }
        // 3. Reconstruct the array by filling elements in order
        var i = 0;
        for (num in 0...m + 1) {
            for (j in 0...counter[num]) {
                nums[i] = num;
                i++;
            }
        }
    }

    /**
     * Complete counting sort (stable implementation)
     */
    public static function countingSort(nums: Array<Int>) {
        if (nums.length == 0) return;
        // 1. Find the maximum element m
        var m = nums[0];
        for (num in nums) {
            if (num > m) m = num;
        }
        // 2. Count occurrences
        var counter = new Array<Int>();
        for (i in 0...m + 1) counter.push(0);
        for (num in nums) {
            counter[num]++;
        }
        // 3. Calculate prefix sums of the counter
        // counter[num] - 1 will be the index of the last occurrence of 'num' in the sorted array
        for (i in 0...m) {
            counter[i + 1] += counter[i];
        }
        // 4. Build the result array by traversing the input array in reverse (stability)
        var n = nums.length;
        var res = new Array<Int>();
        for (i in 0...n) res.push(0);
        var i = n - 1;
        while (i >= 0) {
            var num = nums[i];
            res[counter[num] - 1] = num;
            counter[num]--;
            i--;
        }
        // Copy the sorted results back to the original array
        for (i in 0...n) {
            nums[i] = res[i];
        }
    }

    public static function main() {
        var nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        countingSortNaive(nums);
        Sys.println("After counting sort (naive), nums = [" + nums.join(", ") + "]");

        var nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        countingSort(nums1);
        Sys.println("After counting sort, nums1 = [" + nums1.join(", ") + "]");
    }
}
