/**
 * File: ArrayDeque.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class ArrayDeque {
    private var nums: Array<Int>;
    private var frontIdx: Int;
    private var sizeVal: Int;

    /**
     * Constructor to initialize an array-based deque with fixed capacity
     */
    public function new(capacity: Int) {
        nums = new Array<Int>();
        for (i in 0...capacity) nums.push(0);
        frontIdx = 0;
        sizeVal = 0;
    }

    /**
     * Get the capacity of the underlying array
     */
    public function capacity(): Int {
        return nums.length;
    }

    /**
     * Get the number of elements currently in the deque
     */
    public function size(): Int {
        return sizeVal;
    }

    /**
     * Check if the deque is empty
     */
    public function isEmpty(): Bool {
        return sizeVal == 0;
    }

    /**
     * Helper to compute the circular index for the array
     */
    private function index(i: Int): Int {
        return (i + capacity()) % capacity();
    }

    /**
     * Add an element at the front of the deque
     */
    public function pushFirst(num: Int) {
        if (sizeVal == capacity()) {
            Sys.println("Deque is full");
            return;
        }
        // Shift front index backward
        frontIdx = index(frontIdx - 1);
        nums[frontIdx] = num;
        sizeVal++;
    }

    /**
     * Add an element at the rear of the deque
     */
    public function pushLast(num: Int) {
        if (sizeVal == capacity()) {
            Sys.println("Deque is full");
            return;
        }
        // Calculate rear index based on front index and current size
        var rear = index(frontIdx + sizeVal);
        nums[rear] = num;
        sizeVal++;
    }

    /**
     * Return the front element without removing it
     */
    public function peekFirst(): Int {
        if (isEmpty()) {
            throw "Deque is empty";
        }
        return nums[frontIdx];
    }

    /**
     * Return the rear element without removing it
     */
    public function peekLast(): Int {
        if (isEmpty()) {
            throw "Deque is empty";
        }
        var last = index(frontIdx + sizeVal - 1);
        return nums[last];
    }

    /**
     * Remove and return the front element
     */
    public function popFirst(): Int {
        var num = peekFirst();
        frontIdx = index(frontIdx + 1);
        sizeVal--;
        return num;
    }

    /**
     * Remove and return the rear element
     */
    public function popLast(): Int {
        var num = peekLast();
        sizeVal--;
        return num;
    }

    /**
     * Return all elements in the deque as a standard array for display
     */
    public function toArray(): Array<Int> {
        var res = new Array<Int>();
        for (i in 0...sizeVal) {
            res.push(nums[index(frontIdx + i)]);
        }
        return res;
    }

    public static function main() {
        // Initialize deque
        var deque = new ArrayDeque(10);
        deque.pushLast(3);
        deque.pushLast(2);
        deque.pushLast(5);
        Sys.println("Deque deque = [" + deque.toArray().join(", ") + "]");

        // Peek operations
        var peekFirstVal = deque.peekFirst();
        Sys.println("Front element peekFirst = " + peekFirstVal);
        var peekLastVal = deque.peekLast();
        Sys.println("Rear element peekLast = " + peekLastVal);

        // Push operations
        deque.pushLast(4);
        Sys.println("After pushing 4 to last, deque = [" + deque.toArray().join(", ") + "]");
        deque.pushFirst(1);
        Sys.println("After pushing 1 to first, deque = [" + deque.toArray().join(", ") + "]");

        // Pop operations
        var popLastVal = deque.popLast();
        Sys.println("Popped last element = " + popLastVal + ", after popping last, deque = [" + deque.toArray().join(", ") + "]");
        var popFirstVal = deque.popFirst();
        Sys.println("Popped first element = " + popFirstVal + ", after popping first, deque = [" + deque.toArray().join(", ") + "]");

        // Size check
        var sizeVal = deque.size();
        Sys.println("Deque length size = " + sizeVal);

        // Empty check
        var isEmptyVal = deque.isEmpty();
        Sys.println("Is deque empty = " + isEmptyVal);
    }
}
