/**
 * File: LinkedListQueue.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

import modules.ListNode;

class LinkedListQueue {
    private var frontNode: ListNode; // Head node
    private var rearNode: ListNode;  // Tail node
    private var sizeVal: Int;

    /**
     * Constructor for a queue based on a singly linked list
     */
    public function new() {
        frontNode = null;
        rearNode = null;
        sizeVal = 0;
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
        var node = new ListNode(num);
        if (frontNode == null) {
            frontNode = node;
            rearNode = node;
        } else {
            rearNode.next = node;
            rearNode = node;
        }
        sizeVal++;
    }

    /**
     * Peek at the front element without removing it
     */
    public function peek(): Int {
        if (isEmpty()) {
            throw "Queue is empty";
        }
        return frontNode.val;
    }

    /**
     * Remove and return the front element from the queue
     */
    public function pop(): Int {
        var num = peek();
        frontNode = frontNode.next;
        if (frontNode == null) {
            rearNode = null;
        }
        sizeVal--;
        return num;
    }

    /**
     * Convert the queue to a standard array for display
     */
    public function toList(): Array<Int> {
        var res = new Array<Int>();
        var temp = frontNode;
        while (temp != null) {
            res.push(temp.val);
            temp = temp.next;
        }
        return res;
    }

    public static function main() {
        // Initialize queue
        var queue = new LinkedListQueue();

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
    }
}
