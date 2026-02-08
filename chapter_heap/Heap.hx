/**
 * File: Heap.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_heap;

import modules.PrintUtil;

/**
 * A basic Min-Heap implementation to simulate Nim's std/heapqueue
 */
class MinHeap {
    public var data: Array<Int>;
    public function new() {
        data = new Array<Int>();
    }
    public function push(val: Int) {
        data.push(val);
        siftUp(data.length - 1);
    }
    public function pop(): Int {
        if (data.length == 0) return 0;
        var top = data[0];
        if (data.length > 1) {
            data[0] = data.pop();
            siftDown(0);
        } else {
            data.pop();
        }
        return top;
    }
    public function peek(): Int return data[0];
    public function size(): Int return data.length;
    private function siftUp(i: Int) {
        while (i > 0) {
            var p = Std.int((i - 1) / 2);
            if (data[i] >= data[p]) break;
            var tmp = data[i]; data[i] = data[p]; data[p] = tmp;
            i = p;
        }
    }
    private function siftDown(i: Int) {
        while (true) {
            var l = 2 * i + 1, r = 2 * i + 2, min = i;
            if (l < data.length && data[l] < data[min]) min = l;
            if (r < data.length && data[r] < data[min]) min = r;
            if (min == i) break;
            var tmp = data[i]; data[i] = data[min]; data[min] = tmp;
            i = min;
        }
    }
}

class Heap {
    public static function testPush(heap: MinHeap, val: Int, flag: Int = 1) {
        heap.push(flag * val);
        Sys.println("\nAfter element " + val + " enqueued");
        var res = new Array<Int>();
        for (x in heap.data) res.push(flag * x);
        PrintUtil.printHeap(res);
    }

    public static function testPop(heap: MinHeap, flag: Int = 1) {
        var val = flag * heap.pop();
        Sys.println("\nAfter top element " + val + " dequeued");
        var res = new Array<Int>();
        for (x in heap.data) res.push(flag * x);
        PrintUtil.printHeap(res);
    }

    public static function main() {
        // Demonstrate max-heap by negating elements in a min-heap (similar to Nim logic)
        var maxHeap = new MinHeap();
        var flag = -1;

        Sys.println("\nThe following test cases are for max-heap");

        testPush(maxHeap, 1, flag);
        testPush(maxHeap, 3, flag);
        testPush(maxHeap, 2, flag);
        testPush(maxHeap, 5, flag);
        testPush(maxHeap, 4, flag);

        var peek = flag * maxHeap.peek();
        Sys.println("\nTop element is " + peek);

        testPop(maxHeap, flag);
        testPop(maxHeap, flag);
        testPop(maxHeap, flag);
        testPop(maxHeap, flag);
        testPop(maxHeap, flag);

        Sys.println("\nHeap size is " + maxHeap.size());
        Sys.println("\nIs heap empty: " + (maxHeap.size() == 0));

        // Build min-heap directly
        var minHeap2 = new MinHeap();
        for (x in [1, 3, 2, 5, 4]) {
            minHeap2.push(x);
        }
        Sys.println("\nAfter building min-heap from list");
        PrintUtil.printHeap(minHeap2.data);
    }
}
