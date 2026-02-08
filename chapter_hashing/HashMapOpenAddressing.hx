/**
 * File: HashMapOpenAddressing.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

import chapter_hashing.Pair;

class HashMapOpenAddressing {
    private var sizeVal: Int;
    private var capacityVal: Int;
    private var loadThres: Float;
    private var extendRatio: Int;
    private var buckets: Array<Pair>;
    private var tombstone: Pair;

    /**
     * Constructor for hash map using open addressing (linear probing)
     */
    public function new() {
        sizeVal = 0;
        capacityVal = 4;
        loadThres = 2.0 / 3.0;
        extendRatio = 2;
        buckets = new Array<Pair>();
        for (i in 0...capacityVal) buckets.push(null);
        tombstone = new Pair(-1, "-1");
    }

    /**
     * Hash function to map key to an array index
     */
    private function hashFunc(key: Int): Int {
        return key % capacityVal;
    }

    /**
     * Calculate current load factor
     */
    private function loadFactor(): Float {
        return cast(sizeVal, Float) / capacityVal;
    }

    /**
     * Search for the bucket index corresponding to the key using linear probing
     */
    private function findBucket(key: Int): Int {
        var index = hashFunc(key);
        var firstTombstone = -1;
        // Search linearly until an empty slot is found
        while (buckets[index] != null) {
            // If the key matches, return the index
            if (buckets[index].key == key) {
                // Optimization: move entry to the first available tombstone slot
                if (firstTombstone != -1) {
                    buckets[firstTombstone] = buckets[index];
                    buckets[index] = tombstone;
                    return firstTombstone;
                }
                return index;
            }

            // Keep track of the first tombstone encountered for potential insertion
            if (firstTombstone == -1 && buckets[index] == tombstone) {
                firstTombstone = index;
            }

            // Move to the next index
            index = (index + 1) % capacityVal;
        }

        // Key not found, return index for insertion
        return firstTombstone != -1 ? firstTombstone : index;
    }

    /**
     * Query the value associated with the given key
     */
    public function get(key: Int): String {
        var index = findBucket(key);
        if (buckets[index] != null && buckets[index] != tombstone) {
            return buckets[index].val;
        }
        return "";
    }

    /**
     * Extend the hash map capacity and rehash all active entries
     */
    private function extend() {
        var oldBuckets = buckets;
        capacityVal *= extendRatio;
        buckets = new Array<Pair>();
        for (i in 0...capacityVal) buckets.push(null);
        sizeVal = 0;
        for (pair in oldBuckets) {
            if (pair != null && pair != tombstone) {
                put(pair.key, pair.val);
            }
        }
    }

    /**
     * Add or update a key-value pair
     */
    public function put(key: Int, val: String) {
        // Extend if load factor exceeds threshold
        if (loadFactor() > loadThres) {
            extend();
        }
        var index = findBucket(key);
        // If key already exists, update its value
        if (buckets[index] != null && buckets[index] != tombstone) {
            buckets[index].val = val;
            return;
        }

        // Otherwise, insert a new pair
        buckets[index] = new Pair(key, val);
        sizeVal++;
    }

    /**
     * Delete a key-value pair by marking its slot with a tombstone
     */
    public function remove(key: Int) {
        var index = findBucket(key);
        if (buckets[index] != null && buckets[index] != tombstone) {
            buckets[index] = tombstone;
            sizeVal--;
        }
    }

    /**
     * Print current state of all buckets
     */
    public function print() {
        for (pair in buckets) {
            if (pair == null) {
                Sys.println("None");
            } else if (pair == tombstone) {
                Sys.println("TOMBSTONE");
            } else {
                Sys.println(pair.key + " -> " + pair.val);
            }
        }
    }

    public static function main() {
        // Initialize hash map
        var hashmap = new HashMapOpenAddressing();

        // Add various ID-to-name mappings
        hashmap.put(12836, "Xiao Ha");
        hashmap.put(15937, "Xiao Luo");
        hashmap.put(16750, "Xiao Suan");
        hashmap.put(13276, "Xiao Fa");
        hashmap.put(10583, "Xiao Ya");
        Sys.println("\nAfter adding, hash map is\nKey -> Value");
        hashmap.print();

        // Lookup an entry
        var name = hashmap.get(13276);
        Sys.println("\nInput ID 13276, queried name: " + name);

        // Remove an entry
        hashmap.remove(16750);
        Sys.println("\nAfter deleting 16750, hash map is\nKey -> Value");
        hashmap.print();
    }
}
