/**
 * File: PrintUtil.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package modules;

import modules.ListNode;
import modules.TreeNode;

class Trunk {
    public var prev: Trunk;
    public var str: String;

    public function new(prev: Trunk, str: String) {
        this.prev = prev;
        this.str = str;
    }
}

class PrintUtil {
    /**
     * Print matrix to console
     */
    public static function printMatrix(mat: Array<Array<Int>>) {
        var s = new Array<String>();
        for (arr in mat) {
            s.push("  [" + arr.join(", ") + "]");
        }
        Sys.println("[\n" + s.join(",\n") + "\n]");
    }

    /**
     * Print linked list in the format: val1 -> val2 -> val3
     */
    public static function printLinkedList(head: ListNode) {
        var arr = ListNode.linkedListToList(head);
        Sys.println(arr.join(" -> "));
    }

    private static function showTrunks(p: Trunk) {
        if (p == null) {
            return;
        }
        showTrunks(p.prev);
        Sys.print(p.str);
    }

    /**
     * Print binary tree structure visually
     */
    public static function printTree(root: TreeNode, prev: Trunk = null, isRight: Bool = false) {
        if (root == null) {
            return;
        }

        var prevStr = "    ";
        var trunk = new Trunk(prev, prevStr);
        printTree(root.right, trunk, true);

        if (prev == null) {
            trunk.str = "———";
        } else if (isRight) {
            trunk.str = "/———";
            prevStr = "   |";
        } else {
            trunk.str = "\\———";
            prev.str = prevStr;
        }

        showTrunks(trunk);
        Sys.println(" " + root.val);

        if (prev != null) {
            prev.str = prevStr;
        }
        trunk.str = "   |";
        printTree(root.left, trunk, false);
    }

    /**
     * Print dictionary (Map) in the format: key -> value
     */
    public static function printDict<K, V>(hmap: Map<K, V>) {
        for (key in hmap.keys()) {
            Sys.println(Std.string(key) + " -> " + Std.string(hmap.get(key)));
        }
    }

    /**
     * Print heap (array representation and tree representation)
     */
    public static function printHeap(heap: Array<Int>) {
        Sys.println("Heap array representation: [" + heap.join(", ") + "]");
        Sys.println("Heap tree representation:");
        var optHeap = new Array<Null<Int>>();
        for (x in heap) {
            optHeap.push(x);
        }
        var root = TreeNode.listToTree(optHeap);
        printTree(root);
    }
}
