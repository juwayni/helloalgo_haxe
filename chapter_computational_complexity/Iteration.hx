/**
 * File: Iteration.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_computational_complexity;

class Iteration {
    /**
     * Demonstrate a standard for loop
     */
    public static function forLoop(n: Int): Int {
        var res = 0;
        // Sum 1, 2, ..., n
        for (i in 1...n + 1) {
            res += i;
        }
        return res;
    }

    /**
     * Demonstrate a standard while loop
     */
    public static function whileLoop(n: Int): Int {
        var res = 0;
        var i = 1; // Initialize loop counter
        // Sum 1, 2, ..., n
        while (i <= n) {
            res += i;
            i++; // Increment loop counter
        }
        return res;
    }

    /**
     * Demonstrate a while loop with multiple update steps
     */
    public static function whileLoopII(n: Int): Int {
        var res = 0;
        var i = 1;
        // Sum values with irregular increment
        while (i <= n) {
            res += i;
            i++;
            i *= 2;
        }
        return res;
    }

    /**
     * Demonstrate nested for loops
     */
    public static function nestedForLoop(n: Int): String {
        var res = "";
        // Outer loop
        for (i in 1...n + 1) {
            // Inner loop
            for (j in 1...n + 1) {
                res += "(" + i + ", " + j + "), ";
            }
        }
        return res;
    }

    public static function main() {
        var n = 5;
        var resSum = forLoop(n);
        Sys.println("\nSum from for loop: res = " + resSum);

        resSum = whileLoop(n);
        Sys.println("\nSum from while loop: res = " + resSum);

        resSum = whileLoopII(n);
        Sys.println("\nSum from while loop (two updates): res = " + resSum);

        var resStr = nestedForLoop(n);
        Sys.println("\nTraversal result from nested for loop: " + resStr);
    }
}
