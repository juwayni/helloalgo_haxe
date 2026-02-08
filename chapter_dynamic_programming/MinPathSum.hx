/**
 * File: MinPathSum.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class MinPathSum {
    /**
     * Min path sum: brute force
     */
    private static function minPathSumDfs(grid: Array<Array<Int>>, i: Int, j: Int): Int {
        // If top-left cell, terminate search
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        // If index out of bounds, return infinity
        if (i < 0 || j < 0) {
            return 1000000000; // Use large number as infinity
        }
        // Calculate min path sum from top-left to (i-1, j) and (i, j-1)
        var up = minPathSumDfs(grid, i - 1, j);
        var left = minPathSumDfs(grid, i, j - 1);
        // Return min path sum to (i, j)
        return (up < left ? up : left) + grid[i][j];
    }

    /**
     * Min path sum: memoized search
     */
    private static function minPathSumDfsMem(grid: Array<Array<Int>>, mem: Array<Array<Int>>, i: Int, j: Int): Int {
        if (i == 0 && j == 0) {
            return grid[0][0];
        }
        if (i < 0 || j < 0) {
            return 1000000000;
        }
        if (mem[i][j] != -1) {
            return mem[i][j];
        }
        var up = minPathSumDfsMem(grid, mem, i - 1, j);
        var left = minPathSumDfsMem(grid, mem, i, j - 1);
        mem[i][j] = (up < left ? up : left) + grid[i][j];
        return mem[i][j];
    }

    /**
     * Min path sum: dynamic programming
     */
    public static function minPathSumDp(grid: Array<Array<Int>>): Int {
        var n = grid.length;
        var m = grid[0].length;
        // Initialize dp table
        var dp = new Array<Array<Int>>();
        for (i in 0...n) {
            var row = new Array<Int>();
            for (j in 0...m) row.push(0);
            dp.push(row);
        }

        dp[0][0] = grid[0][0];
        // State transition: first row
        for (j in 1...m) {
            dp[0][j] = dp[0][j - 1] + grid[0][j];
        }
        // State transition: first column
        for (i in 1...n) {
            dp[i][0] = dp[i - 1][0] + grid[i][0];
        }
        // State transition: rest of cells
        for (i in 1...n) {
            for (j in 1...m) {
                var up = dp[i - 1][j];
                var left = dp[i][j - 1];
                dp[i][j] = (up < left ? up : left) + grid[i][j];
            }
        }
        return dp[n - 1][m - 1];
    }

    /**
     * Min path sum: space-optimized dynamic programming
     */
    public static function minPathSumDpComp(grid: Array<Array<Int>>): Int {
        var n = grid.length;
        var m = grid[0].length;
        // Initialize dp array
        var dp = new Array<Int>();
        for (j in 0...m) dp.push(0);
        // First row
        dp[0] = grid[0][0];
        for (j in 1...m) {
            dp[j] = dp[j - 1] + grid[0][j];
        }
        // Rest of rows
        for (i in 1...n) {
            // First column
            dp[0] = dp[0] + grid[i][0];
            // Rest of columns
            for (j in 1...m) {
                var up = dp[j];
                var left = dp[j - 1];
                dp[j] = (up < left ? up : left) + grid[i][j];
            }
        }
        return dp[m - 1];
    }

    public static function main() {
        var grid = [[1, 3, 1, 5], [2, 2, 4, 2], [5, 3, 2, 1], [4, 3, 5, 2]];
        var n = grid.length;
        var m = grid[0].length;

        // Brute force
        var res = minPathSumDfs(grid, n - 1, m - 1);
        Sys.println("Min path sum (brute force) = " + res);

        // Memoized search
        var mem = new Array<Array<Int>>();
        for (i in 0...n) {
            var row = new Array<Int>();
            for (j in 0...m) row.push(-1);
            mem.push(row);
        }
        res = minPathSumDfsMem(grid, mem, n - 1, m - 1);
        Sys.println("Min path sum (memoized) = " + res);

        // Dynamic programming
        res = minPathSumDp(grid);
        Sys.println("Min path sum (DP) = " + res);

        // Space-optimized DP
        res = minPathSumDpComp(grid);
        Sys.println("Min path sum (space-optimized DP) = " + res);
    }
}
