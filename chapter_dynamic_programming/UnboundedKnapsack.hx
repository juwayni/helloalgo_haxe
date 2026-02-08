/**
 * File: UnboundedKnapsack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class UnboundedKnapsack {
    /**
     * Unbounded Knapsack: dynamic programming
     */
    public static function unboundedKnapsackDp(wgt: Array<Int>, val: Array<Int>, cap: Int): Int {
        var n = wgt.length;
        // Initialize dp table
        var dp = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (j in 0...cap + 1) row.push(0);
            dp.push(row);
        }

        // State transition
        for (i in 1...n + 1) {
            for (c in 1...cap + 1) {
                if (wgt[i - 1] > c) {
                    dp[i][c] = dp[i - 1][c];
                } else {
                    var no = dp[i - 1][c];
                    var yes = dp[i][c - wgt[i - 1]] + val[i - 1];
                    dp[i][c] = no > yes ? no : yes;
                }
            }
        }
        return dp[n][cap];
    }

    /**
     * Unbounded Knapsack: space-optimized dynamic programming
     */
    public static function unboundedKnapsackDpComp(wgt: Array<Int>, val: Array<Int>, cap: Int): Int {
        var n = wgt.length;
        // Initialize dp array
        var dp = new Array<Int>();
        for (i in 0...cap + 1) dp.push(0);

        // State transition
        for (i in 1...n + 1) {
            for (c in 1...cap + 1) {
                if (wgt[i - 1] <= c) {
                    var no = dp[c];
                    var yes = dp[c - wgt[i - 1]] + val[i - 1];
                    dp[c] = no > yes ? no : yes;
                }
            }
        }
        return dp[cap];
    }

    public static function main() {
        var wgt = [1, 2, 3];
        var val = [5, 11, 15];
        var cap = 4;

        // Dynamic programming
        var res = unboundedKnapsackDp(wgt, val, cap);
        Sys.println("Max value = " + res);

        // Space-optimized DP
        res = unboundedKnapsackDpComp(wgt, val, cap);
        Sys.println("Max value = " + res);
    }
}
