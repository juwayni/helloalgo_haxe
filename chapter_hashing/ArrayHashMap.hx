/**
 * File: ArrayHashMap.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

import chapter_hashing.Pair;

class ArrayHashMap {
    private var buckets: Array<Pair>;

    /**
     * Constructor for fixed-size array-based hash map
     */
    public function new() {
        buckets = new Array<Pair>();
        // Initialize with 100 null slots
        for (i in 0...100) buckets.push(null);
    }

    /**
     * Hash function to map key to an array index
     */
    private function hashFunc(key: Int): Int {
        // Ensure index is positive using (key % size + size) % size logic
        return (key % 100 + 100) % 100;
    }

    /**
     * Query the value associated with the given key
     */
    public function get(key: Int): String {
        var index = hashFunc(key);
        var pair = buckets[index];
        if (pair == null) {
            return "";
        }
        return pair.val;
    }

    /**
     * Add or update a key-value pair in the hash map
     */
    public function put(key: Int, val: String) {
        var pair = new Pair(key, val);
        var index = hashFunc(key);
        buckets[index] = pair;
    }

    /**
     * Delete a key-value pair from the hash map
     */
    public function remove(key: Int) {
        var index = hashFunc(key);
        buckets[index] = null;
    }

    /**
     * Return all key-value pairs present in the map
     */
    public function entrySet(): Array<Pair> {
        var res = new Array<Pair>();
        for (pair in buckets) {
            if (pair != null) {
                res.push(pair);
            }
        }
        return res;
    }

    /**
     * Return all keys present in the map
     */
    public function keySet(): Array<Int> {
        var res = new Array<Int>();
        for (pair in buckets) {
            if (pair != null) {
                res.push(pair.key);
            }
        }
        return res;
    }

    /**
     * Return all values present in the map
     */
    public function valueSet(): Array<String> {
        var res = new Array<String>();
        for (pair in buckets) {
            if (pair != null) {
                res.push(pair.val);
            }
        }
        return res;
    }

    /**
     * Print all non-empty buckets
     */
    public function print() {
        for (pair in buckets) {
            if (pair != null) {
                Sys.println(pair.key + " -> " + pair.val);
            }
        }
    }

    public static function main() {
        // Initialize hash map
        var hmap = new ArrayHashMap();

        // Add various names mapped to IDs
        hmap.put(12836, "Xiao Ha");
        hmap.put(15937, "Xiao Luo");
        hmap.put(16750, "Xiao Suan");
        hmap.put(13276, "Xiao Fa");
        hmap.put(10583, "Xiao Ya");
        Sys.println("\nAfter adding, hash map is\nKey -> Value");
        hmap.print();

        // Retrieve a value
        var name = hmap.get(15937);
        Sys.println("\nInput ID 15937, queried name: " + name);

        // Remove a value
        hmap.remove(10583);
        Sys.println("\nAfter deleting 10583, hash map is\nKey -> Value");
        hmap.print();

        // Demonstration of traversal methods
        Sys.println("\nTraverse Key->Value pairs");
        for (pair in hmap.entrySet()) {
            Sys.println(pair.key + " -> " + pair.val);
        }

        Sys.println("\nTraverse keys only");
        for (key in hmap.keySet()) {
            Sys.println(key);
        }

        Sys.println("\nTraverse values only");
        for (val in hmap.valueSet()) {
            Sys.println(val);
        }
    }
}
