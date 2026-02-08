/**
 * File: BinaryTree.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_tree;

import modules.TreeNode;
import modules.PrintUtil;

class BinaryTree {
    public static function main() {
        // Initialize binary tree manually by creating nodes and setting references
        var n1 = new TreeNode(1);
        var n2 = new TreeNode(2);
        var n3 = new TreeNode(3);
        var n4 = new TreeNode(4);
        var n5 = new TreeNode(5);

        n1.left = n2;
        n1.right = n3;
        n2.left = n4;
        n2.right = n5;
        Sys.println("\nInitialized binary tree\n");
        PrintUtil.printTree(n1);

        // Insertion demonstration
        var p = new TreeNode(0);
        // Insert node P between n1 and n2 by making n2 a child of P
        n1.left = p;
        p.left = n2;
        Sys.println("\nAfter inserting node P\n");
        PrintUtil.printTree(n1);

        // Deletion demonstration
        // Delete node P by pointing n1's left directly to n2
        n1.left = n2;
        Sys.println("\nAfter deleting node P\n");
        PrintUtil.printTree(n1);
    }
}
