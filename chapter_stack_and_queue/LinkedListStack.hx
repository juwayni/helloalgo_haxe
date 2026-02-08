/**
 * File: LinkedListStack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

import modules.ListNode;

class LinkedListStack {
    private var peekNode: ListNode;
    private var sizeVal: Int;

    /**
     * Constructor for a stack based on a singly linked list
     */
    public function new() {
        peekNode = null;
        sizeVal = 0;
    }

    /**
     * Get the number of elements in the stack
     */
    public function size(): Int {
        return sizeVal;
    }

    /**
     * Check if the stack is empty
     */
    public function isEmpty(): Bool {
        return sizeVal == 0;
    }

    /**
     * Push an element onto the stack
     */
    public function push(val: Int) {
        var node = new ListNode(val);
        node.next = peekNode;
        peekNode = node;
        sizeVal++;
    }

    /**
     * Peek at the top element without removing it
     */
    public function peek(): Int {
        if (isEmpty()) {
            throw "Stack is empty";
        }
        return peekNode.val;
    }

    /**
     * Remove and return the top element from the stack
     */
    public function pop(): Int {
        var num = peek();
        peekNode = peekNode.next;
        sizeVal--;
        return num;
    }

    /**
     * Convert the stack to a standard array for display (reverses to show bottom-to-top)
     */
    public function toList(): Array<Int> {
        var arr = new Array<Int>();
        var node = peekNode;
        while (node != null) {
            arr.push(node.val);
            node = node.next;
        }
        // Reverse to match the typical array representation [bottom, ..., top]
        arr.reverse();
        return arr;
    }

    public static function main() {
        // Initialize stack
        var stack = new LinkedListStack();

        // Push some values
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        Sys.println("Stack stack = [" + stack.toList().join(", ") + "]");

        // Peek top value
        var peekVal = stack.peek();
        Sys.println("Top element peek = " + peekVal);

        // Pop top value
        var popVal = stack.pop();
        Sys.println("Popped element popVal = " + popVal);
        Sys.println("After popping, stack = [" + stack.toList().join(", ") + "]");

        // Check size and emptiness
        var sizeVal = stack.size();
        Sys.println("Stack length size = " + sizeVal);

        var isEmptyVal = stack.isEmpty();
        Sys.println("Is stack empty = " + isEmptyVal);
    }
}
