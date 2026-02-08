/**
 * File: PreOrderTraversalIICompact.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

import modules.TreeNode;
import modules.PrintUtil;

class PreOrderTraversalIICompact {
    private static var path: Array<TreeNode> = [];
    private static var res: Array<Array<TreeNode>> = [];

    /**
     * Pre-order traversal to find all paths from root to nodes with value 7
     */
    private static function preOrder(root: TreeNode) {
        if (root == null) {
            return;
        }
        // Try: add current node to current path
        path.push(root);
        if (root.val == 7) {
            // Record a copy of the current path as a solution
            res.push(path.copy());
        }
        // Recurse into left and right subtrees
        preOrder(root.left);
        preOrder(root.right);
        // Backtrack: remove current node from path before returning
        path.pop();
    }

    public static function main() {
        var root = TreeNode.listToTree([1, 7, 3, 4, 5, 6, 7]);
        Sys.println("\nInitialized binary tree");
        PrintUtil.printTree(root);

        // Reset state and perform pre-order search
        path = [];
        res = [];
        preOrder(root);

        Sys.println("\nOutput all paths from root to nodes with value 7");
        for (p in res) {
            var vals = new Array<Int>();
            for (node in p) {
                vals.push(node.val);
            }
            Sys.println("[" + vals.join(", ") + "]");
        }
    }
}
