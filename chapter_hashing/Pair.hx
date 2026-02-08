/**
 * File: Pair.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

class Pair {
    public var key: Int;
    public var val: String;

    public function new(key: Int, val: String) {
        this.key = key;
        this.val = val;
    }

    public static function main() {
        var p = new Pair(1, "test");
        Sys.println("Pair: " + p.key + " -> " + p.val);
    }
}
