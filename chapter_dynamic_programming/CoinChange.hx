/**
 * File: CoinChange.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class CoinChange {
    /**
     * Find minimum number of coins to reach target amount using dynamic programming
     */
    public static function coinChangeDp(coins: Array<Int>, amt: Int): Int {
        var n = coins.length;
        var maxVal = amt + 1; // Use amt + 1 as an infinity value
        // Initialize dp table
        var dp = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (j in 0...amt + 1) row.push(0);
            dp.push(row);
        }

        // Base case: to make amount > 0 with 0 coins is impossible
        for (a in 1...amt + 1) {
            dp[0][a] = maxVal;
        }

        // State transition
        for (i in 1...n + 1) {
            for (a in 1...amt + 1) {
                if (coins[i - 1] > a) {
                    // Current coin is too large, use result from previous coins
                    dp[i][a] = dp[i - 1][a];
                } else {
                    // Choose the minimum between not picking and picking the current coin
                    var no = dp[i - 1][a];
                    var yes = dp[i][a - coins[i - 1]] + 1;
                    dp[i][a] = (no < yes ? no : yes);
                }
            }
        }

        return dp[n][amt] != maxVal ? dp[n][amt] : -1;
    }

    /**
     * Find minimum number of coins with space optimization
     */
    public static function coinChangeDpComp(coins: Array<Int>, amt: Int): Int {
        var n = coins.length;
        var maxVal = amt + 1;
        // dp[a] stores minimum coins for amount a
        var dp = new Array<Int>();
        for (a in 0...amt + 1) dp.push(maxVal);
        dp[0] = 0;

        // State transition
        for (i in 1...n + 1) {
            for (a in 1...amt + 1) {
                if (coins[i - 1] <= a) {
                    var current = dp[a];
                    var updated = dp[a - coins[i - 1]] + 1;
                    dp[a] = (current < updated ? current : updated);
                }
            }
        }

        return dp[amt] != maxVal ? dp[amt] : -1;
    }

    public static function main() {
        var coins = [1, 2, 5];
        var amt = 4;

        // Solve using standard DP
        var res = coinChangeDp(coins, amt);
        Sys.println("Min number of coins = " + res);

        // Solve using space-optimized DP
        res = coinChangeDpComp(coins, amt);
        Sys.println("Min number of coins = " + res);
    }
}
