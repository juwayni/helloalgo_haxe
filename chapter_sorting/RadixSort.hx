/**
 * File: RadixSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class RadixSort {
    /**
     * Get the digit at a specific place value (exp)
     */
    private static function getDigit(num: Int, exp: Int): Int {
        return Std.int(num / exp) % 10;
    }

    /**
     * Stable counting sort based on a specific digit (exp)
     */
    private static function countingSortDigit(nums: Array<Int>, exp: Int) {
        var n = nums.length;
        var counter = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        // Count occurrences of each digit (0-9)
        for (i in 0...n) {
            var d = getDigit(nums[i], exp);
            counter[d]++;
        }
        // Compute prefix sums
        for (i in 1...10) {
            counter[i] += counter[i - 1];
        }
        // Build result array by traversing in reverse for stability
        var res = new Array<Int>();
        for (i in 0...n) res.push(0);
        var i = n - 1;
        while (i >= 0) {
            var d = getDigit(nums[i], exp);
            res[counter[d] - 1] = nums[i];
            counter[d]--;
            i--;
        }
        // Update original array
        for (i in 0...n) {
            nums[i] = res[i];
        }
    }

    /**
     * Radix sort algorithm (LSD approach)
     */
    public static function radixSort(nums: Array<Int>) {
        if (nums.length == 0) return;
        // Find maximum value to determine number of digits
        var m = nums[0];
        for (num in nums) {
            if (num > m) m = num;
        }
        // Perform counting sort for each digit position
        var exp = 1;
        while (exp <= m) {
            countingSortDigit(nums, exp);
            exp *= 10;
        }
    }

    public static function main() {
        var nums = [
            10546151,
            35663510,
            42865989,
            34862445,
            81883077,
            88906420,
            72429244,
            30524779,
            82060337,
            63832996
        ];
        radixSort(nums);
        Sys.println("After radix sort, nums = [" + nums.join(", ") + "]");
    }
}
