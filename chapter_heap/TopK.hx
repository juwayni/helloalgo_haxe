/**
 * File: TopK.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_heap;

import modules.PrintUtil;

/**
 * A basic Min-Heap implementation to support Top-K search
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

class TopK {
    /**
     * Find the largest k elements in an array using a min-heap
     */
    public static function topKHeap(nums: Array<Int>, k: Int): Array<Int> {
        // Initialize min-heap
        var heap = new MinHeap();
        // Enqueue the first k elements
        for (i in 0...k) {
            heap.push(nums[i]);
        }
        // For the remaining elements, keep the heap size constant at k
        for (i in k...nums.length) {
            // If the current element is larger than the smallest element in the heap, replace it
            if (nums[i] > heap.peek()) {
                heap.pop();
                heap.push(nums[i]);
            }
        }

        // Return all elements currently in the heap
        return heap.data;
    }

    public static function main() {
        var nums = [1, 7, 6, 3, 2];
        var k = 3;

        // Perform top-k search
        var res = topKHeap(nums, k);
        Sys.println("The largest " + k + " elements are");
        PrintUtil.printHeap(res);
    }
}
