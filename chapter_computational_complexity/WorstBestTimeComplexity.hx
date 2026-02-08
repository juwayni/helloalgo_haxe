/**
 * File: WorstBestTimeComplexity.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_computational_complexity;

class WorstBestTimeComplexity {
    /**
     * Generate an array with elements 1, 2, ..., n, and shuffle them randomly
     */
    public static function randomNumbers(n: Int): Array<Int> {
        var nums = new Array<Int>();
        for (i in 1...n + 1) nums.push(i);
        // Fisher-Yates shuffle algorithm
        var i = nums.length - 1;
        while (i > 0) {
            var j = Std.random(i + 1);
            var temp = nums[i];
            nums[i] = nums[j];
            nums[j] = temp;
            i--;
        }
        return nums;
    }

    /**
     * Search for the number 1 in the array and return its index.
     * Best case: O(1) if 1 is at the first position.
     * Worst case: O(n) if 1 is at the last position or not found.
     */
    public static function findOne(nums: Array<Int>): Int {
        for (i in 0...nums.length) {
            if (nums[i] == 1) {
                return i;
            }
        }
        return -1;
    }

    public static function main() {
        // Run several tests with shuffled arrays
        for (i in 0...10) {
            var n = 100;
            var nums = randomNumbers(n);
            var index = findOne(nums);
            Sys.println("\nArray [ 1, 2, ..., n ] after shuffling = [" + nums.join(", ") + "]");
            Sys.println("Index of number 1 is " + index);
        }
    }
}
