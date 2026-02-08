/**
 * File: ClimbingStairsBacktrack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class ClimbingStairsBacktrack {
    /**
     * Solve climbing stairs problem using backtracking
     */
    private static function backtrack(choices: Array<Int>, state: Int, n: Int, res: {val: Int}) {
        // If current stair is the target, we found one solution
        if (state == n) {
            res.val += 1;
        }
        // Explore all possible step sizes
        for (choice in choices) {
            // Pruning: skip if the step exceeds the total number of stairs
            if (state + choice > n) {
                continue;
            }
            // Move to the next state
            backtrack(choices, state + choice, n, res);
        }
    }

    /**
     * Entry point for backtracking solution
     */
    public static function climbingStairsBacktrack(n: Int): Int {
        var choices = [1, 2]; // Allowed steps: 1 or 2 stairs
        var res = {val: 0};
        backtrack(choices, 0, n, res);
        return res.val;
    }

    public static function main() {
        var n = 9;
        var res = climbingStairsBacktrack(n);
        Sys.println("Climbing " + n + " stairs has " + res + " solutions");
    }
}
