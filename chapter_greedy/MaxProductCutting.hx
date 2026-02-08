/**
 * File: MaxProductCutting.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_greedy;

class MaxProductCutting {
    /**
     * Solve the max product cutting problem (Integer Break) using a greedy strategy
     */
    public static function maxProductCutting(n: Int): Int {
        // Base case: for n <= 3, the maximum product requires at least one cut
        if (n <= 3) {
            return 1 * (n - 1);
        }
        // Greedy strategy: break the number into as many 3s as possible
        var a = Std.int(n / 3);
        var b = n % 3;
        if (b == 1) {
            // If remainder is 1, take one 3 and the 1 to make 2 * 2 (4 > 3 * 1)
            return Std.int(Math.pow(3, a - 1)) * 2 * 2;
        }
        if (b == 2) {
            // If remainder is 2, the product is 3^a * 2
            return Std.int(Math.pow(3, a)) * 2;
        }
        // If remainder is 0, the product is simply 3^a
        return Std.int(Math.pow(3, a));
    }

    public static function main() {
        var n = 58;

        // Calculate and print max product for n=58
        var res = maxProductCutting(n);
        Sys.println("Max product cutting = " + res);
    }
}
