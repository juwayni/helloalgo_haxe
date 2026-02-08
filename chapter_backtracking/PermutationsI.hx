/**
 * File: PermutationsI.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class PermutationsI {
    /**
     * Backtracking algorithm to find all permutations of a given array (no duplicates)
     */
    private static function backtrack(state: Array<Int>, choices: Array<Int>, selected: Array<Bool>, res: Array<Array<Int>>) {
        // When state length equals number of choices, a complete permutation is found
        if (state.length == choices.length) {
            res.push(state.copy());
            return;
        }
        // Traverse all available choices
        for (i in 0...choices.length) {
            var choice = choices[i];
            // Pruning: do not allow picking the same element twice in one permutation
            if (!selected[i]) {
                // Try: make a choice, update state and selected flag
                selected[i] = true;
                state.push(choice);
                // Proceed to next round of choices
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore previous state and selected flag
                selected[i] = false;
                state.pop();
            }
        }
    }

    /**
     * Generate all permutations of the given integer array
     */
    public static function permutationsI(nums: Array<Int>): Array<Array<Int>> {
        var res = new Array<Array<Int>>();
        var state = new Array<Int>();
        var selected = new Array<Bool>();
        for (i in 0...nums.length) selected.push(false);
        backtrack(state, nums, selected, res);
        return res;
    }

    public static function main() {
        var nums = [1, 2, 3];
        var res = permutationsI(nums);
        Sys.println("Input array nums = [" + nums.join(", ") + "]");
        var resStr = new Array<String>();
        for (r in res) resStr.push("[" + r.join(", ") + "]");
        Sys.println("All permutations res = [" + resStr.join(", ") + "]");
    }
}
