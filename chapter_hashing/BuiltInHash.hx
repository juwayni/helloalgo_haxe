/**
 * File: BuiltInHash.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_hashing;

import modules.ListNode;

class BuiltInHash {
    public static function main() {
        // Haxe doesn't have a universal built-in 'hash' function for all types like Nim,
        // but we can demonstrate how different types provide hash-like behavior.

        var num = 3;
        // For integers, the value itself is often used as a hash
        var hashNum = num;
        Sys.println("Hash value of integer " + num + " is " + hashNum);

        var bol = true;
        // For booleans, we can map true/false to 1/0
        var hashBol = bol ? 1 : 0;
        Sys.println("Hash value of boolean " + bol + " is " + hashBol);

        var dec = 3.14159;
        // For floats, we can use Std.string or other methods
        var hashDec = Std.string(dec);
        Sys.println("Representing hash of float " + dec + " as string: " + hashDec);

        var strVal = "Hello Algorithm";
        // String objects have their own identity, and we can generate a simple hash
        var hashStr = 0;
        for (i in 0...strVal.length) {
            hashStr = 31 * hashStr + strVal.charCodeAt(i);
        }
        Sys.println("Calculated hash value of string \"" + strVal + "\" is " + hashStr);

        var obj = new ListNode(0);
        // In many targets, we can use Reflect.makeHash or similar,
        // but often we rely on ObjectMap's internal hashing.
        Sys.println("In Haxe, object hashing is typically handled internally by Map<Object, T>");
    }
}
