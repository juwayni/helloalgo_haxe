/**
 * File: SubsetSumI.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class SubsetSumI {
    /**
     * Backtracking algorithm to find all unique subsets that sum to a target value
     */
    private static function backtrack(state: Array<Int>, target: Int, choices: Array<Int>, start: Int, res: Array<Array<Int>>) {
        // If current target is 0, we found a valid subset
        if (target == 0) {
            res.push(state.copy());
            return;
        }
        // Iterate through candidates starting from 'start' to avoid duplicate subsets
        for (i in start...choices.length) {
            // Pruning: since choices are sorted, if current choice > target, all subsequent choices will also be too large
            if (target - choices[i] < 0) {
                break;
            }
            // Try: include the current number in the subset
            state.push(choices[i]);
            // Recurse with reduced target and same start index (allowing repeated use of the same number)
            backtrack(state, target - choices[i], choices, i, res);
            // Backtrack: remove the current number
            state.pop();
        }
    }

    /**
     * Solve the subset sum problem (combinations that sum to target)
     */
    public static function subsetSumI(nums: Array<Int>, target: Int): Array<Array<Int>> {
        var state = new Array<Int>();
        // Sorting candidates allows for efficient pruning
        var sortedNums = nums.copy();
        sortedNums.sort(function(a, b) return a - b);
        var res = new Array<Array<Int>>();
        backtrack(state, target, sortedNums, 0, res);
        return res;
    }

    public static function main() {
        var nums = [3, 4, 5];
        var target = 9;
        var res = subsetSumI(nums, target);
        Sys.println("Input array nums = [" + nums.join(", ") + "], target = " + target);
        var resStr = new Array<String>();
        for (r in res) resStr.push("[" + r.join(", ") + "]");
        Sys.println("All subsets with sum equal to " + target + " res = [" + resStr.join(", ") + "]");
    }
}
