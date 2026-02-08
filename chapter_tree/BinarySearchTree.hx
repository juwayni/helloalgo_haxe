/**
 * File: BinarySearchTree.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class BinarySearchTree {
    private var root: TreeNode;

    /**
     * Constructor for an empty BST
     */
    public function new() {
        this.root = null;
    }

    /**
     * Get the root of the tree
     */
    public function getRoot(): TreeNode {
        return root;
    }

    /**
     * Iterative search for a node with value num
     */
    public function search(num: Int): TreeNode {
        var cur = root;
        while (cur != null) {
            if (cur.val < num) cur = cur.right;
            else if (cur.val > num) cur = cur.left;
            else break;
        }
        return cur;
    }

    /**
     * Iterative insertion of a value into the BST
     */
    public function insert(num: Int) {
        if (root == null) {
            root = new TreeNode(num);
            return;
        }
        var cur = root;
        var pre: TreeNode = null;
        while (cur != null) {
            if (cur.val == num) return; // Value already exists
            pre = cur;
            if (cur.val < num) cur = cur.right;
            else cur = cur.left;
        }

        var node = new TreeNode(num);
        if (pre.val < num) pre.right = node;
        else pre.left = node;
    }

    /**
     * Iterative removal of a value from the BST
     */
    public function remove(num: Int) {
        if (root == null) return;
        var cur = root;
        var pre: TreeNode = null;
        // Search for the node to remove
        while (cur != null) {
            if (cur.val == num) break;
            pre = cur;
            if (cur.val < num) cur = cur.right;
            else cur = cur.left;
        }

        if (cur == null) return; // Not found

        // Case 1 & 2: Node has 0 or 1 child
        if (cur.left == null || cur.right == null) {
            var child = (cur.left != null ? cur.left : cur.right);
            if (cur != root) {
                if (pre.left == cur) pre.left = child;
                else pre.right = child;
            } else {
                root = child;
            }
        }
        // Case 3: Node has 2 children
        else {
            // Replace with inorder successor (leftmost in right subtree)
            var tmp = cur.right;
            while (tmp.left != null) tmp = tmp.left;
            var tmpVal = tmp.val;
            // Recursive-like removal of successor
            remove(tmpVal);
            cur.val = tmpVal;
        }
    }

    public static function main() {
        var bst = new BinarySearchTree();
        var nums = [8, 4, 12, 2, 6, 10, 14, 1, 3, 5, 7, 9, 11, 13, 15];
        for (num in nums) {
            bst.insert(num);
        }
        Sys.println("\nInitialized binary search tree\n");
        PrintUtil.printTree(bst.getRoot());

        var node = bst.search(7);
        Sys.println("\nFound node: " + (node != null ? Std.string(node.val) : "null"));

        bst.insert(16);
        Sys.println("\nAfter inserting node 16\n");
        PrintUtil.printTree(bst.getRoot());

        // Sequential removals for testing
        Sys.println("\nAfter removing node 1");
        bst.remove(1);
        PrintUtil.printTree(bst.getRoot());

        Sys.println("\nAfter removing node 2");
        bst.remove(2);
        PrintUtil.printTree(bst.getRoot());

        Sys.println("\nAfter removing node 4");
        bst.remove(4);
        PrintUtil.printTree(bst.getRoot());
    }
}
