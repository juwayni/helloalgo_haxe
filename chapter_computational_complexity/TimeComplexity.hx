/**
 * File: TimeComplexity.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_computational_complexity;

class TimeComplexity {
    /**
     * O(1) Constant time: operations don't depend on n
     */
    public static function constant(n: Int): Int {
        var count = 0;
        var size = 100000;
        for (i in 0...size) {
            count += 1;
        }
        return count;
    }

    /**
     * O(n) Linear time: single loop over n
     */
    public static function linear(n: Int): Int {
        var count = 0;
        for (i in 0...n) {
            count += 1;
        }
        return count;
    }

    /**
     * O(n) Linear time: traversing an array
     */
    public static function arrayTraversal(nums: Array<Int>): Int {
        var count = 0;
        for (num in nums) {
            count += 1;
        }
        return count;
    }

    /**
     * O(n^2) Quadratic time: nested loops
     */
    public static function quadratic(n: Int): Int {
        var count = 0;
        for (i in 0...n) {
            for (j in 0...n) {
                count += 1;
            }
        }
        return count;
    }

    /**
     * O(n^2) Quadratic time: bubble sort
     */
    public static function bubbleSort(nums: Array<Int>): Int {
        var count = 0;
        var i = nums.length - 1;
        while (i > 0) {
            for (j in 0...i) {
                if (nums[j] > nums[j + 1]) {
                    var tmp = nums[j];
                    nums[j] = nums[j + 1];
                    nums[j + 1] = tmp;
                    count += 3; // Swapping involves 3 operations
                }
            }
            i--;
        }
        return count;
    }

    /**
     * O(2^n) Exponential time: iterative doubling
     */
    public static function exponential(n: Int): Int {
        var count = 0;
        var base = 1;
        for (i in 0...n) {
            for (j in 0...base) {
                count += 1;
            }
            base *= 2;
        }
        return count;
    }

    /**
     * O(2^n) Exponential time: recursive doubling
     */
    public static function expRecur(n: Int): Int {
        if (n == 1) {
            return 1;
        }
        return expRecur(n - 1) + expRecur(n - 1) + 1;
    }

    /**
     * O(log n) Logarithmic time: iterative halving
     */
    public static function logarithmic(n: Float): Int {
        var count = 0;
        var currN = n;
        while (currN > 1) {
            currN = currN / 2;
            count += 1;
        }
        return count;
    }

    /**
     * O(log n) Logarithmic time: recursive halving
     */
    public static function logRecur(n: Float): Int {
        if (n <= 1) {
            return 0;
        }
        return logRecur(n / 2) + 1;
    }

    /**
     * O(n log n) Linear-logarithmic time: recursive partitioning
     */
    public static function linearLogRecur(n: Int): Int {
        if (n <= 1) {
            return 1;
        }
        var count = linearLogRecur(Std.int(n / 2)) + linearLogRecur(Std.int(n / 2));
        for (i in 0...n) {
            count += 1;
        }
        return count;
    }

    /**
     * O(n!) Factorial time: recursive permutations
     */
    public static function factorialRecur(n: Int): Int {
        if (n == 0) {
            return 1;
        }
        var count = 0;
        for (i in 0...n) {
            count += factorialRecur(n - 1);
        }
        return count;
    }

    public static function main() {
        var n = 8;
        Sys.println("Input size n = " + n);

        var count = constant(n);
        Sys.println("Constant time O(1) ops = " + count);

        count = linear(n);
        Sys.println("Linear time O(n) ops = " + count);
        var numsArr = new Array<Int>();
        for (i in 0...n) numsArr.push(0);
        count = arrayTraversal(numsArr);
        Sys.println("Linear time O(n) (traversal) ops = " + count);

        count = quadratic(n);
        Sys.println("Quadratic time O(n^2) ops = " + count);
        var nums = new Array<Int>();
        var i = n;
        while (i >= 1) {
            nums.push(i);
            i--;
        }
        count = bubbleSort(nums);
        Sys.println("Quadratic time O(n^2) (bubble sort) ops = " + count);

        count = exponential(n);
        Sys.println("Exponential time O(2^n) (iterative) ops = " + count);
        count = expRecur(n);
        Sys.println("Exponential time O(2^n) (recursive) ops = " + count);

        count = logarithmic(cast n);
        Sys.println("Logarithmic time O(log n) (iterative) ops = " + count);
        count = logRecur(cast n);
        Sys.println("Logarithmic time O(log n) (recursive) ops = " + count);

        count = linearLogRecur(n);
        Sys.println("Linear-logarithmic time O(n log n) ops = " + count);

        count = factorialRecur(n);
        Sys.println("Factorial time O(n!) ops = " + count);
    }
}
