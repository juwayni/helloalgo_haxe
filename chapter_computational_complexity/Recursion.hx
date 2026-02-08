/**
 * File: Recursion.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_computational_complexity;

class Recursion {
    /**
     * Standard recursion to calculate sum of 1..n
     */
    public static function recur(n: Int): Int {
        // Base case
        if (n == 1) {
            return 1;
        }
        // Recursive call
        var res = recur(n - 1);
        // Combine current value with recursive result
        return n + res;
    }

    /**
     * Simulate recursion using an explicit stack and iteration
     */
    public static function forLoopRecur(n: Int): Int {
        // Explicit stack to store values
        var stack = new Array<Int>();
        var res = 0;
        // Pushing values to stack
        var i = n;
        while (i >= 1) {
            stack.push(i);
            i--;
        }
        // Popping values and accumulating sum
        while (stack.length > 0) {
            res += stack.pop();
        }
        return res;
    }

    /**
     * Tail-recursive implementation of sum calculation
     */
    public static function tailRecur(n: Int, res: Int): Int {
        // Termination condition
        if (n == 0) {
            return res;
        }
        // Tail recursive call: computation is done before call
        return tailRecur(n - 1, res + n);
    }

    /**
     * Recursive calculation of the n-th Fibonacci number
     */
    public static function fib(n: Int): Int {
        // Base cases: f(1)=0, f(2)=1
        if (n == 1 || n == 2) {
            return n - 1;
        }
        // Exponential time complexity O(2^n)
        return fib(n - 1) + fib(n - 2);
    }

    public static function main() {
        var n = 5;
        var res = recur(n);
        Sys.println("\nSum from recursion: res = " + res);

        res = forLoopRecur(n);
        Sys.println("\nSum from iteration simulating recursion: res = " + res);

        res = tailRecur(n, 0);
        Sys.println("\nSum from tail recursion: res = " + res);

        res = fib(n);
        Sys.println("\nFibonacci number at index " + n + " is " + res);
    }
}
