/**
 * File: HashMapChaining.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

import chapter_hashing.Pair;

class HashMapChaining {
    private var sizeVal: Int;
    private var capacityVal: Int;
    private var loadThres: Float;
    private var extendRatio: Int;
    private var buckets: Array<Array<Pair>>;

    /**
     * Constructor for hash map using chaining to handle collisions
     */
    public function new() {
        sizeVal = 0;
        capacityVal = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new Array<Array<Pair>>();
        for (i in 0...capacityVal) {
            buckets.push(new Array<Pair>());
        }
    }

    /**
     * Hash function to map key to an array index
     */
    private function hashFunc(key: Int): Int {
        return key % capacityVal;
    }

    /**
     * Calculate the current load factor of the hash map
     */
    private function loadFactor(): Float {
        return cast(sizeVal, Float) / capacityVal;
    }

    /**
     * Query the value associated with the given key by searching the corresponding chain
     */
    public function get(key: Int): String {
        var index = hashFunc(key);
        var bucket = buckets[index];
        for (pair in bucket) {
            if (pair.key == key) {
                return pair.val;
            }
        }
        return "";
    }

    /**
     * Extend the hash map capacity and rehash existing entries
     */
    private function extend() {
        var oldBuckets = buckets;
        capacityVal *= extendRatio;
        buckets = new Array<Array<Pair>>();
        for (i in 0...capacityVal) {
            buckets.push(new Array<Pair>());
        }
        sizeVal = 0;
        for (bucket in oldBuckets) {
            for (pair in bucket) {
                var index = hashFunc(pair.key);
                buckets[index].push(pair);
                sizeVal++;
            }
        }
    }

    /**
     * Add or update a key-value pair. If load factor exceeds threshold, the map is extended.
     */
    public function put(key: Int, val: String) {
        if (loadFactor() > loadThres) {
            extend();
        }
        var index = hashFunc(key);
        for (pair in buckets[index]) {
            if (pair.key == key) {
                pair.val = val;
                return;
            }
        }

        var pair = new Pair(key, val);
        buckets[index].push(pair);
        sizeVal++;
    }

    /**
     * Delete a key-value pair from its chain
     */
    public function remove(key: Int) {
        var index = hashFunc(key);
        var bucket = buckets[index];
        for (i in 0...bucket.length) {
            if (bucket[i].key == key) {
                bucket.splice(i, 1);
                sizeVal--;
                break;
            }
        }
    }

    /**
     * Print all buckets and their chains
     */
    public function print() {
        for (bucket in buckets) {
            var res = new Array<String>();
            for (pair in bucket) {
                res.push(pair.key + " -> " + pair.val);
            }
            Sys.println("[" + res.join(", ") + "]");
        }
    }

    public static function main() {
        // Initialize hash map
        var hashmap = new HashMapChaining();

        // Add several entries
        hashmap.put(12836, "Xiao Ha");
        hashmap.put(15937, "Xiao Luo");
        hashmap.put(16750, "Xiao Suan");
        hashmap.put(13276, "Xiao Fa");
        hashmap.put(10583, "Xiao Ya");
        Sys.println("\nAfter adding, hash map is\n[Key1 -> Value1, Key2 -> Value2, ...]");
        hashmap.print();

        // Perform a lookup
        var name = hashmap.get(13276);
        Sys.println("\nInput ID 13276, queried name: " + name);

        // Remove an entry
        hashmap.remove(12836);
        Sys.println("\nAfter deleting 12836, hash map is\n[Key1 -> Value1, Key2 -> Value2, ...]");
        hashmap.print();
    }
}
