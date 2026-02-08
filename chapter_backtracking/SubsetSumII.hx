/**
 * File: SubsetSumII.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class SubsetSumII {
    /**
     * Backtracking algorithm to find unique subsets that sum to a target (input may have duplicates)
     */
    private static function backtrack(state: Array<Int>, target: Int, choices: Array<Int>, start: Int, res: Array<Array<Int>>) {
        // Found a valid subset
        if (target == 0) {
            res.push(state.copy());
            return;
        }
        // Iterate candidates starting from 'start' to avoid duplicate subsets
        for (i in start...choices.length) {
            // Pruning: candidates are sorted, so we can stop if candidate exceeds target
            if (target - choices[i] < 0) {
                break;
            }
            // Pruning: skip duplicate elements at the same recursion level to avoid identical subsets
            if (i > start && choices[i] == choices[i - 1]) {
                continue;
            }
            // Try: include current element
            state.push(choices[i]);
            // Recurse with updated target and move to next index (each element used at most once)
            backtrack(state, target - choices[i], choices, i + 1, res);
            // Backtrack
            state.pop();
        }
    }

    /**
     * Solve subset sum II (each input element used at most once)
     */
    public static function subsetSumII(nums: Array<Int>, target: Int): Array<Array<Int>> {
        var state = new Array<Int>();
        // Sorting is crucial for duplicate handling and pruning
        var sortedNums = nums.copy();
        sortedNums.sort(function(a, b) return a - b);
        var res = new Array<Array<Int>>();
        backtrack(state, target, sortedNums, 0, res);
        return res;
    }

    public static function main() {
        var nums = [4, 4, 5];
        var target = 9;
        var res = subsetSumII(nums, target);
        Sys.println("Input array nums = [" + nums.join(", ") + "], target = " + target);
        var resStr = new Array<String>();
        for (r in res) resStr.push("[" + r.join(", ") + "]");
        Sys.println("All subsets with sum equal to " + target + " res = [" + resStr.join(", ") + "]");
    }
}
