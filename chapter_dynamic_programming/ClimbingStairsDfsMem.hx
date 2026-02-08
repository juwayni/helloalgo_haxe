/**
 * File: ClimbingStairsDfsMem.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class ClimbingStairsDfsMem {
    /**
     * Memoized search to solve climbing stairs problem
     */
    private static function dfs(i: Int, mem: Array<Int>): Int {
        // Base cases
        if (i == 1 || i == 2) {
            return i;
        }
        // If result is already computed, return it from memory
        if (mem[i] != -1) {
            return mem[i];
        }
        // Compute and store the result in memory
        var count = dfs(i - 1, mem) + dfs(i - 2, mem);
        mem[i] = count;
        return count;
    }

    /**
     * Entry point for memoized search
     */
    public static function climbingStairsDfsMem(n: Int): Int {
        // Initialize memory table with -1
        var mem = new Array<Int>();
        for (i in 0...n + 1) mem.push(-1);
        return dfs(n, mem);
    }

    public static function main() {
        var n = 9;
        var res = climbingStairsDfsMem(n);
        Sys.println("Climbing " + n + " stairs has " + res + " solutions");
    }
}
