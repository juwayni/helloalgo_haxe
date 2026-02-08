/**
 * File: TreeNode.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package modules;

class TreeNode {
    public var val: Int;
    public var height: Int;
    public var left: TreeNode;
    public var right: TreeNode;

    public function new(val: Int) {
        this.val = val;
        this.height = 0;
        this.left = null;
        this.right = null;
    }

    /**
     * Deserialize a list into a binary tree: recursive
     */
    private static function listToTreeDfs(arr: Array<Null<Int>>, i: Int): TreeNode {
        if (i < 0 || i >= arr.length || arr[i] == null) {
            return null;
        }
        var root = new TreeNode(arr[i]);
        root.left = listToTreeDfs(arr, 2 * i + 1);
        root.right = listToTreeDfs(arr, 2 * i + 2);
        return root;
    }

    /**
     * Deserialize a list into a binary tree
     */
    public static function listToTree(arr: Array<Null<Int>>): TreeNode {
        return listToTreeDfs(arr, 0);
    }

    /**
     * Serialize a binary tree into a list: recursive
     */
    private static function treeToListDfs(root: TreeNode, i: Int, res: Array<Null<Int>>) {
        if (root == null) {
            return;
        }
        while (i >= res.length) {
            res.push(null);
        }
        res[i] = root.val;
        treeToListDfs(root.left, 2 * i + 1, res);
        treeToListDfs(root.right, 2 * i + 2, res);
    }

    /**
     * Serialize a binary tree into a list
     */
    public static function treeToList(root: TreeNode): Array<Null<Int>> {
        var res = new Array<Null<Int>>();
        treeToListDfs(root, 0, res);
        return res;
    }
}
