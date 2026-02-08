/**
 * File: MyHeap.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_heap;

import modules.PrintUtil;

class MyHeap {
    public var maxHeap: Array<Int>;

    /**
     * Constructor for max-heap, can build from an initial list of numbers
     */
    public function new(nums: Array<Int> = null) {
        if (nums == null) {
            maxHeap = new Array<Int>();
        } else {
            maxHeap = nums.copy();
            // Perform heapify for all non-leaf nodes in reverse order
            if (size() > 0) {
                var i = parent(size() - 1);
                while (i >= 0) {
                    siftDown(i);
                    i--;
                }
            }
        }
    }

    /**
     * Get index of left child of node at index i
     */
    private function left(i: Int): Int {
        return 2 * i + 1;
    }

    /**
     * Get index of right child of node at index i
     */
    private function right(i: Int): Int {
        return 2 * i + 2;
    }

    /**
     * Get index of parent of node at index i
     */
    private function parent(i: Int): Int {
        return Std.int((i - 1) / 2);
    }

    /**
     * Swap elements at indices i and j
     */
    private function swap(i: Int, j: Int) {
        var tmp = maxHeap[i];
        maxHeap[i] = maxHeap[j];
        maxHeap[j] = tmp;
    }

    /**
     * Return current number of elements in heap
     */
    public function size(): Int {
        return maxHeap.length;
    }

    /**
     * Check if heap is empty
     */
    public function isEmpty(): Bool {
        return size() == 0;
    }

    /**
     * Access the maximum element (root) without removing it
     */
    public function peek(): Int {
        if (isEmpty()) {
            throw "Heap is empty";
        }
        return maxHeap[0];
    }

    /**
     * Restore heap property by moving element at index i down the tree
     */
    private function siftDown(i: Int) {
        var curr = i;
        while (true) {
            var l = left(curr);
            var r = right(curr);
            var ma = curr;
            // Compare with left child
            if (l < size() && maxHeap[l] > maxHeap[ma]) {
                ma = l;
            }
            // Compare with right child
            if (r < size() && maxHeap[r] > maxHeap[ma]) {
                ma = r;
            }
            // If the current node is larger than both children, we're done
            if (ma == curr) {
                break;
            }
            // Otherwise, swap and continue sifting down
            swap(curr, ma);
            curr = ma;
        }
    }

    /**
     * Restore heap property by moving element at index i up the tree
     */
    private function siftUp(i: Int) {
        var curr = i;
        while (true) {
            var p = parent(curr);
            // Stop if at root or parent is already larger or equal
            if (p < 0 || maxHeap[curr] <= maxHeap[p]) {
                break;
            }
            swap(curr, p);
            curr = p;
        }
    }

    /**
     * Insert a new value into the heap
     */
    public function push(val: Int) {
        maxHeap.push(val);
        siftUp(size() - 1);
    }

    /**
     * Remove and return the maximum element from the heap
     */
    public function pop(): Int {
        if (isEmpty()) {
            throw "Heap is empty";
        }
        // Swap root with last element
        swap(0, size() - 1);
        // Remove the last element
        var val = maxHeap.pop();
        // Restore heap property from the root
        if (!isEmpty()) {
            siftDown(0);
        }
        return val;
    }

    /**
     * Print the heap representation
     */
    public function print() {
        PrintUtil.printHeap(maxHeap);
    }

    public static function main() {
        // Initialize max-heap with a list of values
        var myHeap = new MyHeap([9, 8, 6, 6, 7, 5, 2, 1, 4, 3, 6, 2]);
        Sys.println("\nAfter building max-heap from list");
        myHeap.print();

        // Peek top element
        var peekVal = myHeap.peek();
        Sys.println("\nTop element is " + peekVal);

        // Enqueue element
        var val = 7;
        myHeap.push(val);
        Sys.println("\nAfter element " + val + " enqueued");
        myHeap.print();

        // Dequeue top element
        var popVal = myHeap.pop();
        Sys.println("\nTop element " + popVal + " dequeued");
        myHeap.print();

        // Check size and emptiness
        var sizeVal = myHeap.size();
        Sys.println("\nHeap size is " + sizeVal);

        var isEmptyVal = myHeap.isEmpty();
        Sys.println("\nIs heap empty: " + isEmptyVal);
    }
}
