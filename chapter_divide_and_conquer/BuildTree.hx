/**
 * File: BuildTree.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_divide_and_conquer;

import modules.TreeNode;
import modules.PrintUtil;

class BuildTree {
    /**
     * Recursive function to build binary tree from preorder and inorder traversals
     */
    private static function dfs(
        preorder: Array<Int>,
        inorderMap: Map<Int, Int>,
        i: Int,
        l: Int,
        r: Int
    ): TreeNode {
        // Base case: subtree range is empty
        if (r - l < 0) {
            return null;
        }
        // Create root node from current element in preorder traversal
        var root = new TreeNode(preorder[i]);
        // Locate the root element in inorder traversal to split left and right subtrees
        var m = inorderMap.get(preorder[i]);
        // Recursively build left subtree
        root.left = dfs(preorder, inorderMap, i + 1, l, m - 1);
        // Recursively build right subtree
        root.right = dfs(preorder, inorderMap, i + 1 + m - l, m + 1, r);
        return root;
    }

    /**
     * Build a binary tree given its preorder and inorder traversal sequences
     */
    public static function buildTree(preorder: Array<Int>, inorder: Array<Int>): TreeNode {
        // Map elements to their indices in the inorder sequence for O(1) lookup
        var inorderMap = new Map<Int, Int>();
        for (i in 0...inorder.length) {
            inorderMap.set(inorder[i], i);
        }
        return dfs(preorder, inorderMap, 0, 0, inorder.length - 1);
    }

    public static function main() {
        var preorder = [3, 9, 2, 1, 7];
        var inorder = [9, 3, 1, 2, 7];
        Sys.println("Pre-order = [" + preorder.join(", ") + "]");
        Sys.println("In-order = [" + inorder.join(", ") + "]");

        // Build the tree and display it
        var root = buildTree(preorder, inorder);
        Sys.println("Built binary tree:");
        PrintUtil.printTree(root);
    }
}
