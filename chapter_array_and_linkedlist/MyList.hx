/**
 * File: MyList.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_array_and_linkedlist;

import haxe.ds.Vector;

class MyList {
    private var capacityVal: Int; // capacity
    private var arr: Vector<Int>; // array (stores list elements)
    private var sizeVal: Int; // list length (current number of elements)
    private var extendRatio: Int; // multiple for each expansion

    public function new() {
        capacityVal = 10;
        arr = new Vector<Int>(10);
        sizeVal = 0;
        extendRatio = 2;
    }

    /**
     * Get list length (current number of elements)
     */
    public function size(): Int {
        return sizeVal;
    }

    /**
     * Get list capacity
     */
    public function capacity(): Int {
        return capacityVal;
    }

    /**
     * Access element at given index
     */
    public function get(index: Int): Int {
        if (index < 0 || index >= sizeVal) {
            throw "Index out of bounds";
        }
        return arr[index];
    }

    /**
     * Update element at given index
     */
    public function set(num: Int, index: Int) {
        if (index < 0 || index >= sizeVal) {
            throw "Index out of bounds";
        }
        arr[index] = num;
    }

    /**
     * Extend list capacity when full
     */
    public function extendCapacity() {
        var newCapacity = capacityVal * extendRatio;
        var newArr = new Vector<Int>(newCapacity);
        for (i in 0...sizeVal) {
            newArr[i] = arr[i];
        }
        arr = newArr;
        capacityVal = newCapacity;
    }

    /**
     * Add element at the end of the list
     */
    public function add(num: Int) {
        if (sizeVal == capacityVal) {
            extendCapacity();
        }
        arr[sizeVal] = num;
        sizeVal++;
    }

    /**
     * Insert element at given index, shifting subsequent elements backward
     */
    public function insert(num: Int, index: Int) {
        if (index < 0 || index >= sizeVal) {
            throw "Index out of bounds";
        }
        if (sizeVal == capacityVal) {
            extendCapacity();
        }
        var j = sizeVal - 1;
        while (j >= index) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[index] = num;
        sizeVal++;
    }

    /**
     * Delete element at given index, shifting subsequent elements forward
     */
    public function remove(index: Int): Int {
        if (index < 0 || index >= sizeVal) {
            throw "Index out of bounds";
        }
        var num = arr[index];
        for (j in index...sizeVal - 1) {
            arr[j] = arr[j + 1];
        }
        sizeVal--;
        return num;
    }

    /**
     * Return a Vector of effective length containing the list's elements
     */
    public function toArray(): Vector<Int> {
        var res = new Vector<Int>(sizeVal);
        for (i in 0...sizeVal) {
            res[i] = arr[i];
        }
        return res;
    }

    public static function main() {
        // Initialize list
        var nums = new MyList();
        // Add elements at the end
        nums.add(1);
        nums.add(3);
        nums.add(2);
        nums.add(5);
        nums.add(4);
        Sys.println("List nums = " + Std.string(nums.toArray()) + ", capacity = " + nums.capacity() + ", size = " + nums.size());

        // Insert element in the middle
        nums.insert(6, 3);
        Sys.println("Insert number 6 at index 3, get nums = " + Std.string(nums.toArray()));

        // Delete element
        nums.remove(3);
        Sys.println("Delete element at index 3, get nums = " + Std.string(nums.toArray()));

        // Access element
        var num = nums.get(1);
        Sys.println("Access element at index 1, get num = " + num);

        // Update element
        nums.set(1, 1);
        Sys.println("Update element at index 1 to 1, get nums = " + Std.string(nums.toArray()));

        // Test extension mechanism
        for (i in 0...10) {
            // When i = 5, the list length will exceed the capacity, triggering expansion
            nums.add(i);
        }
        Sys.println("After expansion, list nums = " + Std.string(nums.toArray()) + ", capacity = " + nums.capacity() + ", size = " + nums.size());
    }
}
