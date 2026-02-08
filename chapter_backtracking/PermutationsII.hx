/**
 * File: PermutationsII.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class PermutationsII {
    /**
     * Backtracking algorithm to find all permutations of a given array (with duplicates allowed in input)
     */
    private static function backtrack(state: Array<Int>, choices: Array<Int>, selected: Array<Bool>, res: Array<Array<Int>>) {
        // When state length equals number of choices, a complete permutation is found
        if (state.length == choices.length) {
            res.push(state.copy());
            return;
        }
        // Use a set (Map in Haxe) to keep track of duplicated values at the current recursion level
        var duplicated = new Map<Int, Bool>();
        for (i in 0...choices.length) {
            var choice = choices[i];
            // Pruning:
            // 1. Do not allow duplicate choice of same index
            // 2. Do not allow duplicate choice of same value at the current level
            if (!selected[i] && !duplicated.exists(choice)) {
                // Try: make a choice
                duplicated.set(choice, true); // Record value chosen at this level
                selected[i] = true;
                state.push(choice);
                // Proceed to next round of choices
                backtrack(state, choices, selected, res);
                // Backtrack: undo choice, restore previous state
                selected[i] = false;
                state.pop();
            }
        }
    }

    /**
     * Generate all unique permutations of the given integer array (input may contain duplicates)
     */
    public static function permutationsII(nums: Array<Int>): Array<Array<Int>> {
        var res = new Array<Array<Int>>();
        var state = new Array<Int>();
        var selected = new Array<Bool>();
        for (i in 0...nums.length) selected.push(false);
        backtrack(state, nums, selected, res);
        return res;
    }

    public static function main() {
        var nums = [1, 2, 2];
        var res = permutationsII(nums);
        Sys.println("Input array nums = [" + nums.join(", ") + "]");
        var resStr = new Array<String>();
        for (r in res) resStr.push("[" + r.join(", ") + "]");
        Sys.println("All permutations res = [" + resStr.join(", ") + "]");
    }
}
