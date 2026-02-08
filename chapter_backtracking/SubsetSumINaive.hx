/**
 * File: SubsetSumINaive.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class SubsetSumINaive {
    /**
     * Naive backtracking algorithm for subset sum (may produce duplicate sets and permutations)
     */
    private static function backtrack(state: Array<Int>, target: Int, total: Int, choices: Array<Int>, res: Array<Array<Int>>) {
        // If current total matches target, record the solution
        if (total == target) {
            res.push(state.copy());
            return;
        }
        // Explore all available choices at each step
        for (i in 0...choices.length) {
            // Pruning: if current total + choice exceeds target, skip it
            if (total + choices[i] > target) {
                continue;
            }
            // Try: add choice to subset
            state.push(choices[i]);
            // Recurse with updated total
            backtrack(state, target, total + choices[i], choices, res);
            // Backtrack: remove last choice
            state.pop();
        }
    }

    /**
     * Solve subset sum naively (includes all permutations as separate solutions)
     */
    public static function subsetSumINaive(nums: Array<Int>, target: Int): Array<Array<Int>> {
        var state = new Array<Int>();
        var res = new Array<Array<Int>>();
        backtrack(state, target, 0, nums, res);
        return res;
    }

    public static function main() {
        var nums = [3, 4, 5];
        var target = 9;
        var res = subsetSumINaive(nums, target);
        Sys.println("Input array nums = [" + nums.join(", ") + "], target = " + target);
        var resStr = new Array<String>();
        for (r in res) resStr.push("[" + r.join(", ") + "]");
        Sys.println("All subsets with sum equal to " + target + " res = [" + resStr.join(", ") + "]");
        Sys.println("Note: this method outputs results including duplicate sets (permutations)");
    }
}
