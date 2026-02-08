/**
 * File: ArrayStack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class ArrayStack {
    private var stack: Array<Int>;

    /**
     * Constructor to initialize an array-based stack
     */
    public function new() {
        stack = new Array<Int>();
    }

    /**
     * Get the number of elements in the stack
     */
    public function size(): Int {
        return stack.length;
    }

    /**
     * Check if the stack is empty
     */
    public function isEmpty(): Bool {
        return size() == 0;
    }

    /**
     * Add an element to the top of the stack
     */
    public function push(item: Int) {
        stack.push(item);
    }

    /**
     * Remove and return the top element from the stack
     */
    public function pop(): Int {
        if (isEmpty()) {
            throw "Stack is empty";
        }
        return stack.pop();
    }

    /**
     * Access the top element without removing it
     */
    public function peek(): Int {
        if (isEmpty()) {
            throw "Stack is empty";
        }
        return stack[stack.length - 1];
    }

    /**
     * Return all stack elements as an array for display
     */
    public function toList(): Array<Int> {
        return stack;
    }

    public static function main() {
        // Initialize stack
        var stack = new ArrayStack();

        // Push some values
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        Sys.println("Stack stack = [" + stack.toList().join(", ") + "]");

        // Peek top value
        var peek = stack.peek();
        Sys.println("Top element peek = " + peek);

        // Pop top value
        var popVal = stack.pop();
        Sys.println("Popped element popVal = " + popVal);
        Sys.println("After popping, stack = [" + stack.toList().join(", ") + "]");

        // Check size and emptiness
        var size = stack.size();
        Sys.println("Stack length size = " + size);

        var isEmpty = stack.isEmpty();
        Sys.println("Is stack empty = " + isEmpty);
    }
}
