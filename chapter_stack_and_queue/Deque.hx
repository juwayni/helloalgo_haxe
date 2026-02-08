/**
 * File: Deque.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class Deque {
    public static function main() {
        // In Haxe, the standard Array can act as a deque using:
        // push() - Add to rear
        // pop() - Remove from rear
        // unshift() - Add to front
        // shift() - Remove from front

        // Initialize deque
        var deq = new Array<Int>();

        // Enqueue elements
        deq.push(2);    // Add to rear
        deq.push(5);
        deq.push(4);
        deq.unshift(3); // Add to front
        deq.unshift(1);
        Sys.println("Deque deque = [" + deq.join(", ") + "]");

        // Access elements
        var front = deq[0]; // Front element
        Sys.println("Front element front = " + front);
        var rear = deq[deq.length - 1]; // Rear element
        Sys.println("Rear element rear = " + rear);

        // Dequeue elements
        var popFront = deq.shift(); // Dequeue from front
        Sys.println("Popped front element popFront = " + popFront);
        Sys.println("After popping front, deque = [" + deq.join(", ") + "]");

        var popRear = deq.pop();    // Dequeue from rear
        Sys.println("Popped rear element popRear = " + popRear);
        Sys.println("After popping rear, deque = [" + deq.join(", ") + "]");

        // Get length
        var size = deq.length;
        Sys.println("Deque length size = " + size);

        // Check if empty
        var isEmpty = deq.length == 0;
        Sys.println("Is deque empty = " + isEmpty);
    }
}
