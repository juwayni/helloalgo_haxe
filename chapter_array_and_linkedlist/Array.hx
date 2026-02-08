/**
 * File: Array.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_array_and_linkedlist;

import haxe.ds.Vector;

class Array {
    /**
     * Randomly access an element from the array
     */
    public static function randomAccess(nums: Vector<Int>): Int {
        // Randomly pick a number in the range [0, nums.length - 1]
        var randomIndex = Std.random(nums.length);
        // Get and return the random element
        var randomNum = nums[randomIndex];
        return randomNum;
    }

    /**
     * Extend array length by creating a new larger array and copying elements
     */
    public static function extend(nums: Vector<Int>, enlarge: Int): Vector<Int> {
        // Initialize an array with the extended length
        var res = new Vector<Int>(nums.length + enlarge);
        // Copy all elements from the original array to the new array
        for (i in 0...nums.length) {
            res[i] = nums[i];
        }
        // Fill the rest with zeros
        for (i in nums.length...nums.length + enlarge) {
            res[i] = 0;
        }
        // Return the extended new array
        return res;
    }

    /**
     * Insert element num at index of the array
     */
    public static function insert(nums: Vector<Int>, num: Int, index: Int) {
        // Move all elements at and after index one position backward
        var i = nums.length - 1;
        while (i > index) {
            nums[i] = nums[i - 1];
            i--;
        }
        // Assign num to the element at index
        nums[index] = num;
    }

    /**
     * Delete the element at index by shifting subsequent elements forward
     */
    public static function remove(nums: Vector<Int>, index: Int) {
        // Move all elements after index one position forward
        for (i in index...nums.length - 1) {
            nums[i] = nums[i + 1];
        }
    }

    /**
     * Traverse array using various methods
     */
    public static function traverse(nums: Vector<Int>) {
        var count = 0;
        // Traverse array by index
        for (i in 0...nums.length) {
            count += nums[i];
        }
        // Directly traverse array elements
        for (num in nums) {
            count += num;
        }
        // Traverse both index and element
        for (i in 0...nums.length) {
            var num = nums[i];
            count += num;
        }
    }

    /**
     * Search for specified element in array and return its index
     */
    public static function find(nums: Vector<Int>, target: Int): Int {
        for (i in 0...nums.length) {
            if (nums[i] == target) {
                return i;
            }
        }
        return -1;
    }

    public static function main() {
        // Initialize array
        var arr = new Vector<Int>(5);
        for (i in 0...5) arr[i] = 0;
        Sys.println("Array arr = " + Std.string(arr));

        var nums = new Vector<Int>(5);
        var init = [1, 3, 2, 5, 4];
        for (i in 0...5) nums[i] = init[i];
        Sys.println("Array nums = " + Std.string(nums));

        // Random access
        var randomNum = randomAccess(nums);
        Sys.println("Get random element in nums: " + randomNum);

        // Length extension
        nums = extend(nums, 3);
        Sys.println("Extend array length to 8, get nums = " + Std.string(nums));

        // Insert element
        insert(nums, 6, 3);
        Sys.println("Insert number 6 at index 3, get nums = " + Std.string(nums));

        // Delete element
        remove(nums, 2);
        Sys.println("Delete element at index 2, get nums = " + Std.string(nums));

        // Traverse array
        traverse(nums);

        // Search element
        var index = find(nums, 3);
        Sys.println("Search for element 3 in nums, get index = " + index);
    }
}
