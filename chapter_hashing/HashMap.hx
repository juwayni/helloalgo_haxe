/**
 * File: HashMap.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

import modules.PrintUtil;

class HashMap {
    public static function main() {
        // Initialize Haxe built-in Map (analogous to Nim's Table)
        var hmap = new Map<Int, String>();

        // Add operations
        hmap.set(12836, "Xiao Ha");
        hmap.set(15937, "Xiao Luo");
        hmap.set(16750, "Xiao Suan");
        hmap.set(13276, "Xiao Fa");
        hmap.set(10583, "Xiao Ya");
        Sys.println("\nAfter adding, hash map is\nKey -> Value");
        PrintUtil.printDict(hmap);

        // Query operation
        var name = hmap.get(15937);
        Sys.println("\nInput ID 15937, queried name: " + name);

        // Delete operation
        hmap.remove(10583);
        Sys.println("\nAfter deleting 10583, hash map is\nKey -> Value");
        PrintUtil.printDict(hmap);

        // Traverse hash map using keys and values
        Sys.println("\nTraverse Key->Value pairs");
        for (key in hmap.keys()) {
            Sys.println(key + " -> " + hmap.get(key));
        }

        Sys.println("\nTraverse keys only");
        for (key in hmap.keys()) {
            Sys.println(key);
        }

        Sys.println("\nTraverse values only");
        for (val in hmap.iterator()) {
            Sys.println(val);
        }
    }
}
