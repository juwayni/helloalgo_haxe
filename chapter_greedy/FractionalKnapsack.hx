/**
 * File: FractionalKnapsack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_greedy;

class Item {
    public var w: Int; // Weight
    public var v: Int; // Value
    public function new(w: Int, v: Int) {
        this.w = w;
        this.v = v;
    }
}

class FractionalKnapsack {
    /**
     * Solve fractional knapsack problem using a greedy approach
     */
    public static function fractionalKnapsack(wgt: Array<Int>, val: Array<Int>, cap: Int): Float {
        // Create a list of items
        var items = new Array<Item>();
        for (i in 0...wgt.length) {
            items.push(new Item(wgt[i], val[i]));
        }

        // Sort items by their unit value (value / weight) in descending order
        items.sort(function(x: Item, y: Item): Int {
            var valX = x.v / x.w;
            var valY = y.v / y.w;
            if (valX > valY) return -1;
            if (valX < valY) return 1;
            return 0;
        });

        var res: Float = 0.0;
        var remainingCap: Float = cast cap;
        // Greedily pick items with the highest unit value
        for (item in items) {
            if (item.w <= remainingCap) {
                // Pick the whole item
                res += item.v;
                remainingCap -= item.w;
            } else {
                // Pick a fraction of the remaining item to fill the capacity
                res += (cast(item.v, Float) / item.w) * remainingCap;
                remainingCap = 0;
                break;
            }
        }
        return res;
    }

    public static function main() {
        var wgt = [10, 20, 30, 40, 50];
        var val = [50, 120, 150, 210, 240];
        var cap = 50;

        // Perform greedy calculation
        var res = fractionalKnapsack(wgt, val, cap);
        Sys.println("Max value (fractional knapsack) = " + res);
    }
}
