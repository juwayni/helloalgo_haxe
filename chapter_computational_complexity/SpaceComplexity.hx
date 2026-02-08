/**
 * File: SpaceComplexity.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_computational_complexity;

import modules.ListNode;
import modules.TreeNode;
import modules.PrintUtil;

class SpaceComplexity {
    /**
     * Helper function to demonstrate constant space call
     */
    public static function functionSample(): Int {
        return 0;
    }

    /**
     * Demonstrate O(1) constant space complexity
     */
    public static function constant(n: Int) {
        var a = 0;
        var nums = new Array<Int>();
        // Fixed size allocation is O(1)
        for (i in 0...10000) nums.push(0);
        var node = new ListNode(0);
        // Variables defined in loop take O(1) total as they are reused
        for (i in 0...n) {
            var c = 0;
        }
        // Function calls in loop take O(1) stack space as they return immediately
        for (i in 0...n) {
            functionSample();
        }
    }

    /**
     * Demonstrate O(n) linear space complexity
     */
    public static function linear(n: Int) {
        // Allocation proportional to n
        var nums = new Array<Int>();
        for (i in 0...n) nums.push(0);
        // Hash map size proportional to n
        var hmap = new Map<Int, String>();
        for (i in 0...n) {
            hmap.set(i, Std.string(i));
        }
    }

    /**
     * Demonstrate O(n) linear space complexity via recursion stack
     */
    public static function linearRecur(n: Int) {
        Sys.println("Recursion n = " + n);
        if (n <= 1) {
            return;
        }
        // Stack depth is n
        linearRecur(n - 1);
    }

    /**
     * Demonstrate O(n^2) quadratic space complexity
     */
    public static function quadratic(n: Int) {
        // 2D matrix of size n x n
        var numMatrix = new Array<Array<Int>>();
        for (i in 0...n) {
            var row = new Array<Int>();
            for (j in 0...n) row.push(0);
            numMatrix.push(row);
        }
    }

    /**
     * Demonstrate O(n^2) quadratic space complexity via recursion
     */
    public static function quadraticRecur(n: Int): Int {
        if (n <= 0) {
            return 0;
        }
        // Each call allocates O(n), total depth is n -> total O(n^2)
        var nums = new Array<Int>();
        for (i in 0...n) nums.push(0);
        return quadraticRecur(n - 1);
    }

    /**
     * Demonstrate O(2^n) exponential space complexity by building a tree
     */
    public static function buildTreeSample(n: Int): TreeNode {
        if (n == 0) {
            return null;
        }
        // Building a full binary tree with 2^n - 1 nodes
        var root = new TreeNode(0);
        root.left = buildTreeSample(n - 1);
        root.right = buildTreeSample(n - 1);
        return root;
    }

    public static function main() {
        var n = 5;
        // Constant space
        constant(n);
        // Linear space
        linear(n);
        linearRecur(n);
        // Quadratic space
        quadratic(n);
        quadraticRecur(n);
        // Exponential space
        var root = buildTreeSample(n);
        PrintUtil.printTree(root);
    }
}
