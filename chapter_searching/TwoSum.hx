/**
 * File: TwoSum.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_searching;

class TwoSum {
    /**
     * Method 1: Brute force solution using two nested loops (O(n^2) time)
     */
    public static function twoSumBruteForce(nums: Array<Int>, target: Int): Array<Int> {
        for (i in 0...nums.length - 1) {
            for (j in i + 1...nums.length) {
                if (nums[i] + nums[j] == target) {
                    return [i, j];
                }
            }
        }
        return [];
    }

    /**
     * Method 2: Optimized solution using a hash map (O(n) time)
     */
    public static function twoSumHashTable(nums: Array<Int>, target: Int): Array<Int> {
        // Map to store value-to-index associations
        var dic = new Map<Int, Int>();
        for (i in 0...nums.length) {
            var complement = target - nums[i];
            // Check if complement exists in the map
            if (dic.exists(complement)) {
                return [dic.get(complement), i];
            }
            // Store current value and its index
            dic.set(nums[i], i);
        }
        return [];
    }

    public static function main() {
        // Test array and target
        var nums = [2, 7, 11, 15];
        var target = 13;

        // Execute and print results for both methods
        var res = twoSumBruteForce(nums, target);
        Sys.println("Method 1 res = [" + res.join(", ") + "]");

        res = twoSumHashTable(nums, target);
        Sys.println("Method 2 res = [" + res.join(", ") + "]");
    }
}
