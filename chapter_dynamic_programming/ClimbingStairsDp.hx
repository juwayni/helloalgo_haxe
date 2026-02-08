/**
 * File: ClimbingStairsDp.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class ClimbingStairsDp {
    /**
     * Solve climbing stairs using dynamic programming (O(n) time, O(n) space)
     */
    public static function climbingStairsDp(n: Int): Int {
        if (n == 1 || n == 2) {
            return n;
        }
        // Initialize dp table
        var dp = new Array<Int>();
        for (i in 0...n + 1) dp.push(0);
        // Base cases
        dp[1] = 1;
        dp[2] = 2;
        // State transitions: dp[i] = dp[i-1] + dp[i-2]
        for (i in 3...n + 1) {
            dp[i] = dp[i - 1] + dp[i - 2];
        }
        return dp[n];
    }

    /**
     * Solve climbing stairs with space optimization (O(n) time, O(1) space)
     */
    public static function climbingStairsDpComp(n: Int): Int {
        if (n == 1 || n == 2) {
            return n;
        }
        var a = 1;
        var b = 2;
        for (i in 3...n + 1) {
            var temp = b;
            b = a + b;
            a = temp;
        }
        return b;
    }

    public static function main() {
        var n = 9;
        var res = climbingStairsDp(n);
        Sys.println("Climbing " + n + " stairs has " + res + " solutions");

        res = climbingStairsDpComp(n);
        Sys.println("Climbing " + n + " stairs has " + res + " solutions");
    }
}
