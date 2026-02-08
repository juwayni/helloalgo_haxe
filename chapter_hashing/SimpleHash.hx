/**
 * File: SimpleHash.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

class SimpleHash {
    /**
     * Additive hash function: sum of character codes
     */
    public static function addHash(key: String): Int {
        var h: Int = 0;
        var modulus: Int = 1000000007;
        for (i in 0...key.length) {
            h = (h + key.charCodeAt(i)) % modulus;
        }
        return h;
    }

    /**
     * Multiplicative hash function: polynomial rolling hash
     */
    public static function mulHash(key: String): Int {
        var h: Float = 0; // Using Float to handle large integer accumulation before modulo
        var modulus: Int = 1000000007;
        for (i in 0...key.length) {
            h = (31 * h + key.charCodeAt(i)) % modulus;
        }
        return Std.int(h);
    }

    /**
     * XOR hash function: bitwise XOR of character codes
     */
    public static function xorHash(key: String): Int {
        var h: Int = 0;
        var modulus: Int = 1000000007;
        for (i in 0...key.length) {
            h = (h ^ key.charCodeAt(i)) % modulus;
        }
        return h;
    }

    /**
     * Rotational hash function: combines shifting and XOR
     */
    public static function rotHash(key: String): Int {
        var h: Int = 0;
        var modulus: Int = 1000000007;
        for (i in 0...key.length) {
            // Simulated unsigned 32-bit rotational shift
            var shiftedLeft = (h << 4);
            var shiftedRight = (h >>> 28);
            h = (shiftedLeft ^ shiftedRight ^ key.charCodeAt(i)) % modulus;
        }
        return h;
    }

    public static function main() {
        var key = "Hello Algorithm";

        // Demonstrate different simple hashing methods
        var h = addHash(key);
        Sys.println("Additive hash value = " + h);

        h = mulHash(key);
        Sys.println("Multiplicative hash value = " + h);

        h = xorHash(key);
        Sys.println("XOR hash value = " + h);

        h = rotHash(key);
        Sys.println("Rotational hash value = " + h);
    }
}
