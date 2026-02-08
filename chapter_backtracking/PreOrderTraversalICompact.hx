/**
 * File: PreOrderTraversalICompact.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

import modules.TreeNode;
import modules.PrintUtil;

class PreOrderTraversalICompact {
    private static var res: Array<TreeNode> = [];

    /**
     * Pre-order traversal to find all nodes with value 7
     */
    private static function preOrder(root: TreeNode) {
        if (root == null) {
            return;
        }
        if (root.val == 7) {
            // Record solution if node value matches target
            res.push(root);
        }
        // Recursively visit left and right children
        preOrder(root.left);
        preOrder(root.right);
    }

    public static function main() {
        // Initialize binary tree from a list (level-order representation)
        var root = TreeNode.listToTree([1, 7, 3, 4, 5, 6, 7]);
        Sys.println("\nInitialized binary tree");
        PrintUtil.printTree(root);

        // Pre-order traversal to collect nodes with value 7
        res = [];
        preOrder(root);

        Sys.println("\nOutput all nodes with value 7");
        var vals = new Array<Int>();
        for (node in res) {
            vals.push(node.val);
        }
        Sys.println("[" + vals.join(", ") + "]");
    }
}
