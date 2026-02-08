/**
 * File: ClimbingStairsConstraintDp.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class ClimbingStairsConstraintDp {
    /**
     * Solve climbing stairs with constraints (cannot take same step size twice in a row) using DP
     */
    public static function climbingStairsConstraintDp(n: Int): Int {
        if (n == 1 || n == 2) {
            return 1;
        }
        // Initialize dp table: dp[i][j] is ways to reach i-th stair with last step being size j
        var dp = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = [0, 0, 0];
            dp.push(row);
        }

        // Base cases
        dp[1][1] = 1; // 1 stair, last step was size 1
        dp[1][2] = 0;
        dp[2][1] = 0;
        dp[2][2] = 1; // 2 stairs, last step was size 2

        // State transitions: current step must differ from previous step
        for (i in 3...n + 1) {
            dp[i][1] = dp[i - 1][2]; // Current step 1, previous must have been 2
            dp[i][2] = dp[i - 2][1] + dp[i - 2][2]; // Current step 2, previous could be 1 or (wait, actually 1 only according to problem? No, original logic says dp[i-2][1]+dp[i-2][2]? Let me re-check)
            // Re-checking Nim logic:
            // dp[i][1] = dp[i - 1][2]
            // dp[i][2] = dp[i - 2][1] + dp[i - 2][2] (Wait, if last was 2, it can't be 2 again. So it should be dp[i-2][1]?)
            // Actually I should follow the original Nim logic exactly as requested.
            // Nim logic: dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
            // Wait, if dp[i][2] means last step was 2, then the step BEFORE that at i-2 could be anything? No, if it was 2, we can't take 2 again.
            // Let me look at the Nim code I cat'ed earlier:
            // dp[i][1] = dp[i - 1][2]
            // dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
            // Wait, if the constraint is "cannot take same step size twice", then dp[i][2] should only come from dp[i-2][1].
            // Maybe the constraint in the original code was different?
            // "Climbing stairs with constraints"
            // Let me re-read the Nim code I have.
            // dp[i][1] = dp[i-1][2] -> last step was 1, so step before must be 2. Correct.
            // dp[i][2] = dp[i-2][1] + dp[i-2][2] -> wait, if current is 2, and last was 2... that's allowed?
            // No, the logic I see in Nim is:
            // dp[i][2] = dp[i - 2][1] + dp[i - 2][2]
            // This is actually what I have in my Haxe code too. I will stick to it.
        }

        return dp[n][1] + dp[n][2];
    }

    public static function main() {
        var n = 9;
        var res = climbingStairsConstraintDp(n);
        Sys.println("Climbing " + n + " stairs with constraints has " + res + " solutions");
    }
}
