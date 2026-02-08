/**
 * File: BucketSort.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_sorting;

class BucketSort {
    /**
     * Bucket sort algorithm for floats in the range [0, 1)
     */
    public static function bucketSort(nums: Array<Float>) {
        if (nums.length <= 1) return;

        // Initialize k = n/2 buckets
        var k = Std.int(nums.length / 2);
        var buckets = new Array<Array<Float>>();
        for (i in 0...k) {
            buckets.push(new Array<Float>());
        }

        // 1. Distribute elements into buckets based on their values
        for (num in nums) {
            var i = Std.int(num * k);
            // Ensure index is within range [0, k-1]
            if (i >= k) i = k - 1;
            buckets[i].push(num);
        }

        // 2. Sort each bucket individually
        for (bucket in buckets) {
            bucket.sort(function(a, b) return (a < b ? -1 : (a > b ? 1 : 0)));
        }

        // 3. Concatenate all sorted buckets back into the original array
        var i = 0;
        for (bucket in buckets) {
            for (num in bucket) {
                nums[i] = num;
                i++;
            }
        }
    }

    public static function main() {
        // Assume input data are floats in the range [0, 1)
        var nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37];
        bucketSort(nums);
        Sys.println("After bucket sort, nums = [" + nums.join(", ") + "]");
    }
}
