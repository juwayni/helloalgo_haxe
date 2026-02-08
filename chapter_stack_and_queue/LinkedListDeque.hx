/**
 * File: LinkedListDeque.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

/**
 * Helper class for a doubly linked list node
 */
class ListNode {
    public var val: Int;
    public var next: ListNode;
    public var prev: ListNode;

    public function new(val: Int) {
        this.val = val;
        this.next = null;
        this.prev = null;
    }
}

class LinkedListDeque {
    private var frontNode: ListNode; // Head of the list
    private var rearNode: ListNode;  // Tail of the list
    private var sizeVal: Int;

    /**
     * Constructor for a deque based on a doubly linked list
     */
    public function new() {
        frontNode = null;
        rearNode = null;
        sizeVal = 0;
    }

    /**
     * Get the number of elements in the deque
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
     * Helper to push an element to either the front or the rear
     */
    public function push(num: Int, isFront: Bool) {
        var node = new ListNode(num);
        if (isEmpty()) {
            frontNode = node;
            rearNode = node;
        } else if (isFront) {
            frontNode.prev = node;
            node.next = frontNode;
            frontNode = node;
        } else {
            rearNode.next = node;
            node.prev = rearNode;
            rearNode = node;
        }
        sizeVal++;
    }

    /**
     * Add element at the front
     */
    public function pushFirst(num: Int) {
        push(num, true);
    }

    /**
     * Add element at the rear
     */
    public function pushLast(num: Int) {
        push(num, false);
    }

    /**
     * Helper to pop an element from either the front or the rear
     */
    public function pop(isFront: Bool): Int {
        if (isEmpty()) {
            throw "Deque is empty";
        }
        var val: Int;
        if (isFront) {
            val = frontNode.val;
            var fnext = frontNode.next;
            if (fnext != null) {
                fnext.prev = null;
                frontNode.next = null;
            } else {
                rearNode = null;
            }
            frontNode = fnext;
        } else {
            val = rearNode.val;
            var rprev = rearNode.prev;
            if (rprev != null) {
                rprev.next = null;
                rearNode.prev = null;
            } else {
                frontNode = null;
            }
            rearNode = rprev;
        }
        sizeVal--;
        return val;
    }

    /**
     * Remove and return the front element
     */
    public function popFirst(): Int {
        return pop(true);
    }

    /**
     * Remove and return the rear element
     */
    public function popLast(): Int {
        return pop(false);
    }

    /**
     * Peek at the front element
     */
    public function peekFirst(): Int {
        if (isEmpty()) {
            throw "Deque is empty";
        }
        return frontNode.val;
    }

    /**
     * Peek at the rear element
     */
    public function peekLast(): Int {
        if (isEmpty()) {
            throw "Deque is empty";
        }
        return rearNode.val;
    }

    /**
     * Convert the deque to an array for display
     */
    public function toArray(): Array<Int> {
        var res = new Array<Int>();
        var node = frontNode;
        while (node != null) {
            res.push(node.val);
            node = node.next;
        }
        return res;
    }

    public static function main() {
        // Initialize deque
        var deque = new LinkedListDeque();
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
