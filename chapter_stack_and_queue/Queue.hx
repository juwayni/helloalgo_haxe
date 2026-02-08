/**
 * File: Queue.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_stack_and_queue;

class Queue {
    public static function main() {
        // Haxe's standard Array can serve as a queue using:
        // push() - Enqueue at rear
        // shift() - Dequeue from front

        // Initialize queue
        var que = new Array<Int>();

        // Enqueue elements
        que.push(1);
        que.push(3);
        que.push(2);
        que.push(5);
        que.push(4);
        Sys.println("Queue que = [" + que.join(", ") + "]");

        // Access the front element
        var front = que[0];
        Sys.println("Front element front = " + front);

        // Dequeue an element
        var popVal = que.shift();
        Sys.println("Dequeued element popVal = " + popVal);
        Sys.println("After dequeueing, que = [" + que.join(", ") + "]");

        // Get length
        var size = que.length;
        Sys.println("Queue length size = " + size);

        // Check if empty
        var isEmpty = que.length == 0;
        Sys.println("Is queue empty = " + isEmpty);
    }
}
