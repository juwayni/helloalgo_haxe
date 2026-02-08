/**
 * File: Knapsack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class Knapsack {
    /**
     * 0-1 Knapsack: brute force
     */
    private static function knapsackDfs(wgt: Array<Int>, val: Array<Int>, i: Int, c: Int): Int {
        // Base case: no items left or capacity is 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If weight of current item exceeds capacity, it cannot be picked
        if (wgt[i - 1] > c) {
            return knapsackDfs(wgt, val, i - 1, c);
        }
        // Calculate max value of not picking and picking the current item
        var no = knapsackDfs(wgt, val, i - 1, c);
        var yes = knapsackDfs(wgt, val, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Return the larger of the two
        return no > yes ? no : yes;
    }

    /**
     * 0-1 Knapsack: memoized search
     */
    private static function knapsackDfsMem(wgt: Array<Int>, val: Array<Int>, mem: Array<Array<Int>>, i: Int, c: Int): Int {
        // Base case: no items left or capacity is 0
        if (i == 0 || c == 0) {
            return 0;
        }
        // If record already exists, return it
        if (mem[i][c] != -1) {
            return mem[i][c];
        }
        // If weight of current item exceeds capacity, it cannot be picked
        if (wgt[i - 1] > c) {
            return knapsackDfsMem(wgt, val, mem, i - 1, c);
        }
        // Calculate max value of not picking and picking the current item
        var no = knapsackDfsMem(wgt, val, mem, i - 1, c);
        var yes = knapsackDfsMem(wgt, val, mem, i - 1, c - wgt[i - 1]) + val[i - 1];
        // Record and return the result
        mem[i][c] = no > yes ? no : yes;
        return mem[i][c];
    }

    /**
     * 0-1 Knapsack: dynamic programming
     */
    public static function knapsackDp(wgt: Array<Int>, val: Array<Int>, cap: Int): Int {
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
                    var yes = dp[i - 1][c - wgt[i - 1]] + val[i - 1];
                    dp[i][c] = no > yes ? no : yes;
                }
            }
        }
        return dp[n][cap];
    }

    /**
     * 0-1 Knapsack: space-optimized dynamic programming
     */
    public static function knapsackDpComp(wgt: Array<Int>, val: Array<Int>, cap: Int): Int {
        var n = wgt.length;
        // Initialize dp array
        var dp = new Array<Int>();
        for (i in 0...cap + 1) dp.push(0);

        // State transition
        for (i in 1...n + 1) {
            // Traverse in reverse order to avoid using updated values from the same row
            var c = cap;
            while (c >= 1) {
                if (wgt[i - 1] <= c) {
                    var no = dp[c];
                    var yes = dp[c - wgt[i - 1]] + val[i - 1];
                    dp[c] = no > yes ? no : yes;
                }
                c--;
            }
        }
        return dp[cap];
    }

    public static function main() {
        var wgt = [10, 20, 30, 40, 50];
        var val = [50, 120, 150, 210, 240];
        var cap = 50;
        var n = wgt.length;

        // Brute force
        var res = knapsackDfs(wgt, val, n, cap);
        Sys.println("Max value (brute force) = " + res);

        // Memoized search
        var mem = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (c in 0...cap + 1) row.push(-1);
            mem.push(row);
        }
        res = knapsackDfsMem(wgt, val, mem, n, cap);
        Sys.println("Max value (memoized) = " + res);

        // Dynamic programming
        res = knapsackDp(wgt, val, cap);
        Sys.println("Max value (DP) = " + res);

        // Space-optimized DP
        res = knapsackDpComp(wgt, val, cap);
        Sys.println("Max value (space-optimized DP) = " + res);
    }
}
