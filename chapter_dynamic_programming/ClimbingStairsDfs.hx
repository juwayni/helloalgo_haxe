/**
 * File: ClimbingStairsDfs.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class ClimbingStairsDfs {
    /**
     * Recursive search to solve climbing stairs problem (Brute force, O(2^n))
     */
    private static function dfs(i: Int): Int {
        // Base cases: 1 way to reach 1st stair, 2 ways to reach 2nd stair
        if (i == 1 || i == 2) {
            return i;
        }
        // Number of ways to reach stair i is sum of ways to reach i-1 and i-2
        return dfs(i - 1) + dfs(i - 2);
    }

    /**
     * Entry point for DFS solution
     */
    public static function climbingStairsDfs(n: Int): Int {
        return dfs(n);
    }

    public static function main() {
        var n = 9;
        var res = climbingStairsDfs(n);
        Sys.println("Climbing " + n + " stairs has " + res + " solutions");
    }
}
