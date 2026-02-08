/**
 * File: ArrayQueue.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class ArrayQueue {
    private var nums: Array<Int>; // Array to store elements
    private var frontIdx: Int;    // Index of the front element
    private var sizeVal: Int;     // Current number of elements in the queue

    /**
     * Constructor to initialize an array-based queue with fixed capacity
     */
    public function new(size: Int) {
        nums = new Array<Int>();
        for (i in 0...size) nums.push(0);
        frontIdx = 0;
        sizeVal = 0;
    }

    /**
     * Get the capacity of the queue
     */
    public function capacity(): Int {
        return nums.length;
    }

    /**
     * Get the number of elements in the queue
     */
    public function size(): Int {
        return sizeVal;
    }

    /**
     * Check if the queue is empty
     */
    public function isEmpty(): Bool {
        return sizeVal == 0;
    }

    /**
     * Add an element to the rear of the queue
     */
    public function push(num: Int) {
        if (sizeVal == capacity()) {
            throw "Queue is full";
        }
        // Calculate rear index using modulo for circularity
        var rear = (frontIdx + sizeVal) % capacity();
        nums[rear] = num;
        sizeVal++;
    }

    /**
     * Access the front element without removing it
     */
    public function peek(): Int {
        if (isEmpty()) {
            throw "Queue is empty";
        }
        return nums[frontIdx];
    }

    /**
     * Remove and return the front element from the queue
     */
    public function pop(): Int {
        var num = peek();
        // Advance front index circularly
        frontIdx = (frontIdx + 1) % capacity();
        sizeVal--;
        return num;
    }

    /**
     * Return all current elements in the queue as an array for display
     */
    public function toList(): Array<Int> {
        var res = new Array<Int>();
        for (i in 0...sizeVal) {
            res.push(nums[(frontIdx + i) % capacity()]);
        }
        return res;
    }

    public static function main() {
        // Initialize queue
        var queue = new ArrayQueue(10);

        // Enqueue some elements
        queue.push(1);
        queue.push(3);
        queue.push(2);
        queue.push(5);
        queue.push(4);
        Sys.println("Queue queue = [" + queue.toList().join(", ") + "]");

        // Peek front element
        var peekVal = queue.peek();
        Sys.println("Front element peek = " + peekVal);

        // Dequeue an element
        var popVal = queue.pop();
        Sys.println("Dequeued element pop = " + popVal);
        Sys.println("After dequeueing, queue = [" + queue.toList().join(", ") + "]");

        // Check size and emptiness
        var sizeVal = queue.size();
        Sys.println("Queue length size = " + sizeVal);

        var isEmptyVal = queue.isEmpty();
        Sys.println("Is queue empty = " + isEmptyVal);

        // Test circular array property
        for (i in 0...10) {
            queue.push(i);
            queue.pop();
            Sys.println("Round " + i + " enqueue + dequeue, queue = [" + queue.toList().join(", ") + "]");
        }
    }
}
