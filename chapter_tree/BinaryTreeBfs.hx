/**
 * File: BinaryTreeBfs.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class BinaryTreeBfs {
    /**
     * Perform level-order traversal (Breadth-First Search) on the binary tree
     */
    public static function levelOrder(root: TreeNode): Array<Int> {
        if (root == null) return [];
        // Initialize a queue for BFS and add the root
        var queue = new Array<TreeNode>();
        queue.push(root);
        // List to store the visited node values
        var res = new Array<Int>();

        while (queue.length > 0) {
            // Dequeue from front
            var node = queue.shift();
            res.push(node.val);
            // Enqueue children if they exist
            if (node.left != null) {
                queue.push(node.left);
            }
            if (node.right != null) {
                queue.push(node.right);
            }
        }
        return res;
    }

    public static function main() {
        // Build binary tree from a level-order array representation
        var arr: Array<Null<Int>> = [1, 2, 3, 4, 5, 6, 7];
        var root = TreeNode.listToTree(arr);
        Sys.println("\nInitialized binary tree\n");
        PrintUtil.printTree(root);

        // Perform traversal and print the sequence
        var res = levelOrder(root);
        Sys.println("\nLevel-order traversal sequence = [" + res.join(", ") + "]");
    }
}
