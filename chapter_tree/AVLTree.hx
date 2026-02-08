/**
 * File: AVLTree.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class AVLTree {
    private var root: TreeNode;

    /**
     * Constructor for an empty AVL Tree
     */
    public function new() {
        this.root = null;
    }

    /**
     * Return the root node of the tree
     */
    public function getRoot(): TreeNode {
        return root;
    }

    /**
     * Get the height of a given node (-1 for null)
     */
    public function height(node: TreeNode): Int {
        return node != null ? node.height : -1;
    }

    /**
     * Update a node's height based on its children
     */
    private function updateHeight(node: TreeNode) {
        var h_l = height(node.left);
        var h_r = height(node.right);
        node.height = (h_l > h_r ? h_l : h_r) + 1;
    }

    /**
     * Calculate the balance factor of a node (left height - right height)
     */
    public function balanceFactor(node: TreeNode): Int {
        if (node == null) return 0;
        return height(node.left) - height(node.right);
    }

    /**
     * Perform a right rotation on a node
     */
    private function rightRotate(node: TreeNode): TreeNode {
        var child = node.left;
        var grandChild = child.right;
        // Rotate
        child.right = node;
        node.left = grandChild;
        // Update heights
        updateHeight(node);
        updateHeight(child);
        return child;
    }

    /**
     * Perform a left rotation on a node
     */
    private function leftRotate(node: TreeNode): TreeNode {
        var child = node.right;
        var grandChild = child.left;
        // Rotate
        child.left = node;
        node.right = grandChild;
        // Update heights
        updateHeight(node);
        updateHeight(child);
        return child;
    }

    /**
     * Rebalance a subtree via rotations based on its balance factor
     */
    private function rotate(node: TreeNode): TreeNode {
        var bf = balanceFactor(node);
        // Left heavy
        if (bf > 1) {
            if (balanceFactor(node.left) >= 0) {
                return rightRotate(node);
            } else {
                node.left = leftRotate(node.left);
                return rightRotate(node);
            }
        }
        // Right heavy
        if (bf < -1) {
            if (balanceFactor(node.right) <= 0) {
                return leftRotate(node);
            } else {
                node.right = rightRotate(node.right);
                return leftRotate(node);
            }
        }
        return node;
    }

    /**
     * Recursive helper for insertion
     */
    private function insertHelper(node: TreeNode, val: Int): TreeNode {
        if (node == null) return new TreeNode(val);

        if (val < node.val) {
            node.left = insertHelper(node.left, val);
        } else if (val > node.val) {
            node.right = insertHelper(node.right, val);
        } else {
            return node; // Duplicate not allowed
        }

        updateHeight(node);
        return rotate(node);
    }

    /**
     * Insert a value into the AVL tree
     */
    public function insert(val: Int) {
        root = insertHelper(root, val);
    }

    /**
     * Recursive helper for removal
     */
    private function removeHelper(node: TreeNode, val: Int): TreeNode {
        if (node == null) return null;

        var curr = node;
        if (val < curr.val) {
            curr.left = removeHelper(curr.left, val);
        } else if (val > curr.val) {
            curr.right = removeHelper(curr.right, val);
        } else {
            // Found node to delete
            if (curr.left == null || curr.right == null) {
                var child = (curr.left != null ? curr.left : curr.right);
                if (child == null) return null; // 0 child case
                curr = child; // 1 child case
            } else {
                // 2 children case: find successor
                var temp = curr.right;
                while (temp.left != null) temp = temp.left;
                curr.right = removeHelper(curr.right, temp.val);
                curr.val = temp.val;
            }
        }

        updateHeight(curr);
        return rotate(curr);
    }

    /**
     * Remove a value from the AVL tree
     */
    public function remove(val: Int) {
        root = removeHelper(root, val);
    }

    /**
     * Search for a value in the tree
     */
    public function search(val: Int): TreeNode {
        var cur = root;
        while (cur != null) {
            if (cur.val < val) cur = cur.right;
            else if (cur.val > val) cur = cur.left;
            else break;
        }
        return cur;
    }

    public static function main() {
        var avlTree = new AVLTree();

        // Sequential test insertions
        for (val in [1, 2, 3, 4, 5, 8, 7, 9, 10, 6]) {
            avlTree.insert(val);
            Sys.println("\nAfter inserting node " + val + ", AVL tree is");
            PrintUtil.printTree(avlTree.getRoot());
        }

        avlTree.insert(7); // Test duplicate insertion

        Sys.println("\nAfter removing node 8 (degree 0)");
        avlTree.remove(8);
        PrintUtil.printTree(avlTree.getRoot());

        Sys.println("\nAfter removing node 5 (degree 1)");
        avlTree.remove(5);
        PrintUtil.printTree(avlTree.getRoot());

        Sys.println("\nAfter removing node 4 (degree 2)");
        avlTree.remove(4);
        PrintUtil.printTree(avlTree.getRoot());

        var resNode = avlTree.search(7);
        Sys.println("\nFound node: " + (resNode != null ? Std.string(resNode.val) : "null"));
    }
}
