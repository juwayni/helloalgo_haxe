/**
 * File: EditDistance.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_dynamic_programming;

class EditDistance {
    /**
     * Calculate minimum edit distance using brute force search
     */
    private static function editDistanceDfs(s: String, t: String, i: Int, j: Int): Int {
        // Base case: if both strings are empty
        if (i == 0 && j == 0) {
            return 0;
        }
        // Base case: if one string is empty, we need all characters from the other
        if (i == 0) return j;
        if (j == 0) return i;

        // If characters match, no operation needed for this position
        if (s.charAt(i - 1) == t.charAt(j - 1)) {
            return editDistanceDfs(s, t, i - 1, j - 1);
        }
        // Try all three operations: insert, delete, replace
        var insertOp = editDistanceDfs(s, t, i, j - 1);
        var deleteOp = editDistanceDfs(s, t, i - 1, j);
        var replaceOp = editDistanceDfs(s, t, i - 1, j - 1);
        // Minimum of three operations + 1
        var minOp = (insertOp < deleteOp ? insertOp : deleteOp);
        minOp = (minOp < replaceOp ? minOp : replaceOp);
        return minOp + 1;
    }

    /**
     * Calculate minimum edit distance using memoized search
     */
    private static function editDistanceDfsMem(s: String, t: String, mem: Array<Array<Int>>, i: Int, j: Int): Int {
        if (i == 0 && j == 0) return 0;
        if (i == 0) return j;
        if (j == 0) return i;

        if (mem[i][j] != -1) {
            return mem[i][j];
        }

        if (s.charAt(i - 1) == t.charAt(j - 1)) {
            return editDistanceDfsMem(s, t, mem, i - 1, j - 1);
        }

        var insertOp = editDistanceDfsMem(s, t, mem, i, j - 1);
        var deleteOp = editDistanceDfsMem(s, t, mem, i - 1, j);
        var replaceOp = editDistanceDfsMem(s, t, mem, i - 1, j - 1);
        var minOp = (insertOp < deleteOp ? insertOp : deleteOp);
        minOp = (minOp < replaceOp ? minOp : replaceOp);

        mem[i][j] = minOp + 1;
        return mem[i][j];
    }

    /**
     * Calculate minimum edit distance using dynamic programming
     */
    public static function editDistanceDp(s: String, t: String): Int {
        var n = s.length;
        var m = t.length;
        var dp = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (j in 0...m + 1) row.push(0);
            dp.push(row);
        }

        // Base cases: first row and column represent deletions/insertions from empty strings
        for (i in 1...n + 1) dp[i][0] = i;
        for (j in 1...m + 1) dp[0][j] = j;

        // State transition
        for (i in 1...n + 1) {
            for (j in 1...m + 1) {
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    dp[i][j] = dp[i - 1][j - 1];
                } else {
                    var minPrev = (dp[i][j - 1] < dp[i - 1][j] ? dp[i][j - 1] : dp[i - 1][j]);
                    minPrev = (minPrev < dp[i - 1][j - 1] ? minPrev : dp[i - 1][j - 1]);
                    dp[i][j] = minPrev + 1;
                }
            }
        }
        return dp[n][m];
    }

    /**
     * Calculate minimum edit distance with space optimization
     */
    public static function editDistanceDpComp(s: String, t: String): Int {
        var n = s.length;
        var m = t.length;
        var dp = new Array<Int>();
        for (j in 0...m + 1) dp.push(j);

        for (i in 1...n + 1) {
            var leftup = dp[0]; // Stores dp[i-1][j-1]
            dp[0] += 1;
            for (j in 1...m + 1) {
                var temp = dp[j];
                if (s.charAt(i - 1) == t.charAt(j - 1)) {
                    dp[j] = leftup;
                } else {
                    var minPrev = (dp[j - 1] < dp[j] ? dp[j - 1] : dp[j]);
                    minPrev = (minPrev < leftup ? minPrev : leftup);
                    dp[j] = minPrev + 1;
                }
                leftup = temp;
            }
        }
        return dp[m];
    }

    public static function main() {
        var s = "bag";
        var t = "pack";
        var n = s.length;
        var m = t.length;

        // Brute force solution
        var res = editDistanceDfs(s, t, n, m);
        Sys.println("Steps from " + s + " to " + t + " (brute force) = " + res);

        // Memoized search solution
        var mem = new Array<Array<Int>>();
        for (i in 0...n + 1) {
            var row = new Array<Int>();
            for (j in 0...m + 1) row.push(-1);
            mem.push(row);
        }
        res = editDistanceDfsMem(s, t, mem, n, m);
        Sys.println("Steps from " + s + " to " + t + " (memoized) = " + res);

        // DP solution
        res = editDistanceDp(s, t);
        Sys.println("Steps from " + s + " to " + t + " (DP) = " + res);

        // Space-optimized DP solution
        res = editDistanceDpComp(s, t);
        Sys.println("Steps from " + s + " to " + t + " (space-optimized DP) = " + res);
    }
}
