/**
 * File: List.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_array_and_linkedlist;

class List {
    public static function main() {
        // Initialize list
        var nums = [1, 3, 2, 5, 4];
        Sys.println("\nList nums = [" + nums.join(", ") + "]");

        // Access element
        var x = nums[1];
        Sys.println("\nAccess element at index 1, get x = " + x);

        // Update element
        nums[1] = 0;
        Sys.println("\nUpdate element at index 1 to 0, get nums = [" + nums.join(", ") + "]");

        // Clear list
        nums = [];
        Sys.println("\nAfter clearing list nums = [" + nums.join(", ") + "]");

        // Append elements at the end
        nums.push(1);
        nums.push(3);
        nums.push(2);
        nums.push(5);
        nums.push(4);
        Sys.println("\nAfter adding elements nums = [" + nums.join(", ") + "]");

        // Insert element in the middle
        nums.insert(3, 6); // Haxe Array.insert(index, value)
        Sys.println("\nInsert number 6 at index 3, get nums = [" + nums.join(", ") + "]");

        // Delete element
        nums.splice(3, 1);
        Sys.println("\nDelete element at index 3, get nums = [" + nums.join(", ") + "]");

        // Traverse list by index
        var count = 0;
        for (i in 0...nums.length) {
            count += nums[i];
        }
        // Directly traverse list elements
        for (num in nums) {
            count += num;
        }

        // Concatenate two lists
        var nums1 = [6, 8, 7, 10, 9];
        nums = nums.concat(nums1);
        Sys.println("\nAfter concatenating nums1 to nums, get nums = [" + nums.join(", ") + "]");

        // Sort list in ascending order
        nums.sort(function(a, b) return a - b);
        Sys.println("\nAfter sorting list nums = [" + nums.join(", ") + "]");
    }
}
