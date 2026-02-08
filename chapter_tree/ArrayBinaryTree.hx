/**
 * File: ArrayBinaryTree.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class ArrayBinaryTree {
    private var tree: Array<Null<Int>>;
    private var res: Array<Int>;

    /**
     * Constructor for a binary tree represented by an array
     */
    public function new(arr: Array<Null<Int>>) {
        this.tree = arr;
    }

    /**
     * Get the number of nodes in the array representation
     */
    public function size(): Int {
        return tree.length;
    }

    /**
     * Get the value of the node at index i
     */
    public function val(i: Int): Null<Int> {
        if (i < 0 || i >= size()) return null;
        return tree[i];
    }

    /**
     * Get the index of the left child of node at index i
     */
    public function left(i: Int): Int {
        return 2 * i + 1;
    }

    /**
     * Get the index of the right child of node at index i
     */
    public function right(i: Int): Int {
        return 2 * i + 2;
    }

    /**
     * Get the index of the parent of node at index i
     */
    public function parent(i: Int): Int {
        return Std.int((i - 1) / 2);
    }

    /**
     * Perform level-order traversal
     */
    public function levelOrder(): Array<Int> {
        var res = new Array<Int>();
        for (i in 0...size()) {
            if (val(i) != null) {
                res.push(val(i));
            }
        }
        return res;
    }

    /**
     * Recursive depth-first search helper
     */
    private function dfs(i: Int, order: String) {
        if (val(i) == null) return;

        // Pre-order logic
        if (order == "pre") res.push(val(i));

        dfs(left(i), order);

        // In-order logic
        if (order == "in") res.push(val(i));

        dfs(right(i), order);

        // Post-order logic
        if (order == "post") res.push(val(i));
    }

    /**
     * Pre-order traversal
     */
    public function preOrder(): Array<Int> {
        res = new Array<Int>();
        dfs(0, "pre");
        return res;
    }

    /**
     * In-order traversal
     */
    public function inOrder(): Array<Int> {
        res = new Array<Int>();
        dfs(0, "in");
        return res;
    }

    /**
     * Post-order traversal
     */
    public function postOrder(): Array<Int> {
        res = new Array<Int>();
        dfs(0, "post");
        return res;
    }

    public static function main() {
        // Initialize binary tree with an array (null represents no node)
        var arr: Array<Null<Int>> = [1, 2, 3, 4, null, 6, 7, 8, 9, null, null, 12, null, null, 15];
        var root = TreeNode.listToTree(arr);
        Sys.println("\nInitialized binary tree\n");
        Sys.println("Array representation of binary tree:");
        Sys.println("[" + arr.join(", ") + "]");
        Sys.println("Linked list representation of binary tree:");
        PrintUtil.printTree(root);

        // ArrayBinaryTree instance
        var abt = new ArrayBinaryTree(arr);

        // Demonstrate child/parent indexing
        var i = 1;
        var l = abt.left(i);
        var r = abt.right(i);
        var p = abt.parent(i);
        Sys.println("\nCurrent node index = " + i + ", value = " + (abt.val(i) != null ? Std.string(abt.val(i)) : "None"));
        Sys.println("Left child index = " + l + ", value = " + (abt.val(l) != null ? Std.string(abt.val(l)) : "None"));
        Sys.println("Right child index = " + r + ", value = " + (abt.val(r) != null ? Std.string(abt.val(r)) : "None"));
        Sys.println("Parent index = " + p + ", value = " + (abt.val(p) != null ? Std.string(abt.val(p)) : "None"));

        // Perform and print various traversals
        Sys.println("\nLevel-order traversal: [" + abt.levelOrder().join(", ") + "]");
        Sys.println("Pre-order traversal: [" + abt.preOrder().join(", ") + "]");
        Sys.println("In-order traversal: [" + abt.inOrder().join(", ") + "]");
        Sys.println("Post-order traversal: [" + abt.postOrder().join(", ") + "]");
    }
}
