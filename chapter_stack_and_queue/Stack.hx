/**
 * File: Stack.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class Stack {
    public static function main() {
        // Haxe's standard Array can serve as a stack using:
        // push() - Add to top
        // pop() - Remove from top

        // Initialize stack
        var stack = new Array<Int>();

        // Push some values
        stack.push(1);
        stack.push(3);
        stack.push(2);
        stack.push(5);
        stack.push(4);
        Sys.println("Stack stack = [" + stack.join(", ") + "]");

        // Peek at the top value
        var peek = stack[stack.length - 1];
        Sys.println("Top element peek = " + peek);

        // Pop a value from the top
        var popVal = stack.pop();
        Sys.println("Popped element popVal = " + popVal);
        Sys.println("After popping, stack = [" + stack.join(", ") + "]");

        // Check size and emptiness
        var size = stack.length;
        Sys.println("Stack length size = " + size);

        var isEmpty = stack.length == 0;
        Sys.println("Is stack empty = " + isEmpty);
    }
}
