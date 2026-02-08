/**
 * File: PreOrderTraversalIIICompact.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

import modules.TreeNode;
import modules.PrintUtil;

class PreOrderTraversalIIICompact {
    private static var path: Array<TreeNode> = [];
    private static var res: Array<Array<TreeNode>> = [];

    /**
     * Pre-order traversal with pruning: find all paths from root to nodes with value 7,
     * but stop exploring any path that encounters a node with value 3.
     */
    private static function preOrder(root: TreeNode) {
        // Pruning: if node is null or its value is 3, terminate this branch
        if (root == null || root.val == 3) {
            return;
        }
        // Try: add current node to current path
        path.push(root);
        if (root.val == 7) {
            // Record a copy of the current path as a solution
            res.push(path.copy());
        }
        // Recurse into subtrees
        preOrder(root.left);
        preOrder(root.right);
        // Backtrack: remove current node from path
        path.pop();
    }

    public static function main() {
        var root = TreeNode.listToTree([1, 7, 3, 4, 5, 6, 7]);
        Sys.println("\nInitialized binary tree");
        PrintUtil.printTree(root);

        path = [];
        res = [];
        preOrder(root);

        Sys.println("\nOutput all paths from root to nodes with value 7, excluding nodes with value 3");
        for (p in res) {
            var vals = new Array<Int>();
            for (node in p) {
                vals.push(node.val);
            }
            Sys.println("[" + vals.join(", ") + "]");
        }
    }
}
