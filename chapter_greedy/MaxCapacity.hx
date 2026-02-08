/**
 * File: MaxCapacity.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_greedy;

class MaxCapacity {
    /**
     * Solve the max capacity problem (Container With Most Water) using two pointers
     */
    public static function maxCapacity(ht: Array<Int>): Int {
        // Initialize two pointers at both ends of the heights array
        var i = 0;
        var j = ht.length - 1;
        var res = 0;
        // Greedily move the pointers inward to find the largest container
        while (i < j) {
            // Capacity is limited by the shorter board
            var h = (ht[i] < ht[j] ? ht[i] : ht[j]);
            var cap = h * (j - i);
            // Update maximum capacity found so far
            if (cap > res) res = cap;
            // Move the shorter board inward because it limits the potential capacity
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    public static function main() {
        var ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // Find and print maximum capacity
        var res = maxCapacity(ht);
        Sys.println("Max capacity = " + res);
    }
}
