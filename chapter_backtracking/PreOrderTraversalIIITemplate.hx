/**
 * File: PreOrderTraversalIIITemplate.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

import modules.TreeNode;
import modules.PrintUtil;

class PreOrderTraversalIIITemplate {
    /**
     * Check if the current state (path) is a complete solution
     */
    private static function isSolution(state: Array<TreeNode>): Bool {
        return state.length > 0 && state[state.length - 1].val == 7;
    }

    /**
     * Record the current solution into the results list
     */
    private static function recordSolution(state: Array<TreeNode>, res: Array<Array<TreeNode>>) {
        res.push(state.copy());
    }

    /**
     * Check if choosing the given node is valid according to problem constraints
     */
    private static function isValid(state: Array<TreeNode>, choice: TreeNode): Bool {
        return choice != null && choice.val != 3;
    }

    /**
     * Update current state by including the chosen node
     */
    private static function makeChoice(state: Array<TreeNode>, choice: TreeNode) {
        state.push(choice);
    }

    /**
     * Undo the last choice to restore the previous state
     */
    private static function undoChoice(state: Array<TreeNode>, choice: TreeNode) {
        state.pop();
    }

    /**
     * General backtracking template applied to the tree traversal problem
     */
    private static function backtrack(state: Array<TreeNode>, choices: Array<TreeNode>, res: Array<Array<TreeNode>>) {
        // If current state is a solution, record it
        if (isSolution(state)) {
            recordSolution(state, res);
        }
        // Explore all possible choices from the current state
        for (choice in choices) {
            // Pruning: check if choice is valid
            if (isValid(state, choice)) {
                // Try: make a choice
                makeChoice(state, choice);
                // Recursively call backtrack with new choices (left and right children)
                backtrack(state, [choice.left, choice.right], res);
                // Backtrack: undo the choice
                undoChoice(state, choice);
            }
        }
    }

    public static function main() {
        var root = TreeNode.listToTree([1, 7, 3, 4, 5, 6, 7]);
        Sys.println("\nInitialized binary tree");
        PrintUtil.printTree(root);

        // Standard backtracking execution
        var res = new Array<Array<TreeNode>>();
        var state = new Array<TreeNode>();
        backtrack(state, [root], res);

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
