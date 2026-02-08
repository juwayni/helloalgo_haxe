/**
 * File: CoinChangeII.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class CoinChangeII {
    /**
     * Find total number of combinations to reach target amount using dynamic programming
     */
    public static function coinChangeIIDp(coins: Array<Int>, amt: Int): Int {
        var n = coins.length;
        // Initialize dp table
        var dp = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (j in 0...amt + 1) row.push(0);
            dp.push(row);
        }

        // Base case: there is 1 way to make amount 0 (by picking nothing)
        for (i in 0...n + 1) {
            dp[i][0] = 1;
        }

        // State transition
        for (i in 1...n + 1) {
            for (a in 1...amt + 1) {
                if (coins[i - 1] > a) {
                    // Cannot use current coin, same as previous number of ways
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Sum of ways by not picking and by picking current coin
                    dp[i][a] = dp[i - 1][a] + dp[i][a - coins[i - 1]];
                }
            }
        }

        return dp[n][amt];
    }

    /**
     * Find total combinations with space optimization
     */
    public static function coinChangeIIDpComp(coins: Array<Int>, amt: Int): Int {
        var n = coins.length;
        var dp = new Array<Int>();
        for (i in 0...amt + 1) dp.push(0);
        dp[0] = 1;

        for (i in 1...n + 1) {
            for (a in 1...amt + 1) {
                if (coins[i - 1] <= a) {
                    dp[a] = dp[a] + dp[a - coins[i - 1]];
                }
            }
        }

        return dp[amt];
    }

    public static function main() {
        var coins = [1, 2, 5];
        var amt = 5;

        // Solve using standard DP
        var res = coinChangeIIDp(coins, amt);
        Sys.println("Number of combinations = " + res);

        // Solve using space-optimized DP
        res = coinChangeIIDpComp(coins, amt);
        Sys.println("Number of combinations = " + res);
    }
}
