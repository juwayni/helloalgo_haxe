/**
 * File: MinCostClimbingStairsDp.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class MinCostClimbingStairsDp {
    /**
     * Min cost climbing stairs: dynamic programming
     */
    public static function minCostClimbingStairsDp(cost: Array<Int>): Int {
        var n = cost.length - 1;
        if (n == 1 || n == 2) {
            return cost[n];
        }
        // Initialize dp table
        var dp = new Array<Int>();
        for (i in 0...n + 1) dp.push(0);
        // Base cases
        dp[1] = cost[1];
        dp[2] = cost[2];
        // State transitions
        for (i in 3...n + 1) {
            var minPrev = dp[i - 1] < dp[i - 2] ? dp[i - 1] : dp[i - 2];
            dp[i] = minPrev + cost[i];
        }
        return dp[n];
    }

    /**
     * Min cost climbing stairs: dynamic programming with space optimization
     */
    public static function minCostClimbingStairsDpComp(cost: Array<Int>): Int {
        var n = cost.length - 1;
        if (n == 1 || n == 2) {
            return cost[n];
        }
        var a = cost[1];
        var b = cost[2];
        for (i in 3...n + 1) {
            var temp = b;
            var minPrev = a < b ? a : b;
            b = minPrev + cost[i];
            a = temp;
        }
        return b;
    }

    public static function main() {
        var cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1];
        Sys.println("Input cost list = [" + cost.join(", ") + "]");

        var res = minCostClimbingStairsDp(cost);
        Sys.println("Min cost = " + res);

        res = minCostClimbingStairsDpComp(cost);
        Sys.println("Min cost = " + res);
    }
}
