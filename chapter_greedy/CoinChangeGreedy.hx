/**
 * File: CoinChangeGreedy.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_greedy;

class CoinChangeGreedy {
    /**
     * Solve coin change problem using a greedy approach
     */
    public static function coinChangeGreedy(coins: Array<Int>, amt: Int): Int {
        // Assume coins are already sorted in ascending order
        var i = coins.length - 1;
        var count = 0;
        var currentAmt = amt;
        // Continuously pick the largest possible coin
        while (currentAmt > 0) {
            // Move to the largest coin that is less than or equal to the remaining amount
            while (i > 0 && coins[i] > currentAmt) {
                i--;
            }
            // Subtract the chosen coin value from the remaining amount
            currentAmt -= coins[i];
            count++;
        }
        // If amount is reduced to exactly zero, return coin count; otherwise, return -1 (not possible)
        return currentAmt == 0 ? count : -1;
    }

    public static function main() {
        // Example 1: Greedy yields an optimal solution
        var coins = [1, 5, 10, 20, 50, 100];
        var amt = 186;
        var res = coinChangeGreedy(coins, amt);
        Sys.println("\ncoins = [" + coins.join(", ") + "], amt = " + amt);
        Sys.println("Min number of coins needed = " + res);

        // Example 2: Greedy does NOT yield an optimal solution
        coins = [1, 20, 50];
        amt = 60;
        res = coinChangeGreedy(coins, amt);
        Sys.println("\ncoins = [" + coins.join(", ") + "], amt = " + amt);
        Sys.println("Min number of coins needed = " + res);
        Sys.println("Actual min number is 3 (20 + 20 + 20)");

        // Example 3: Greedy fails to find optimal (49 + 49 = 98, 2 coins)
        coins = [1, 49, 50];
        amt = 98;
        res = coinChangeGreedy(coins, amt);
        Sys.println("\ncoins = [" + coins.join(", ") + "], amt = " + amt);
        Sys.println("Min number of coins needed = " + res);
        Sys.println("Actual min number is 2 (49 + 49)");
    }
}
