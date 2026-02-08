/**
 * File: BinaryTreeDfs.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class BinaryTreeDfs {
    private static var res: Array<Int> = [];

    /**
     * Recursive pre-order traversal (Root -> Left -> Right)
     */
    public static function preOrder(root: TreeNode) {
        if (root == null) return;
        res.push(root.val);
        preOrder(root.left);
        preOrder(root.right);
    }

    /**
     * Recursive in-order traversal (Left -> Root -> Right)
     */
    public static function inOrder(root: TreeNode) {
        if (root == null) return;
        inOrder(root.left);
        res.push(root.val);
        inOrder(root.right);
    }

    /**
     * Recursive post-order traversal (Left -> Right -> Root)
     */
    public static function postOrder(root: TreeNode) {
        if (root == null) return;
        postOrder(root.left);
        postOrder(root.right);
        res.push(root.val);
    }

    public static function main() {
        // Build binary tree from a level-order array representation
        var arr: Array<Null<Int>> = [1, 2, 3, 4, 5, 6, 7];
        var root = TreeNode.listToTree(arr);
        Sys.println("\nInitialized binary tree\n");
        PrintUtil.printTree(root);

        // Pre-order traversal sequence
        res = [];
        preOrder(root);
        Sys.println("\nPre-order traversal sequence = [" + res.join(", ") + "]");

        // In-order traversal sequence
        res = [];
        inOrder(root);
        Sys.println("\nIn-order traversal sequence = [" + res.join(", ") + "]");

        // Post-order traversal sequence
        res = [];
        postOrder(root);
        Sys.println("\nPost-order traversal sequence = [" + res.join(", ") + "]");
    }
}
