/**
 * File: Hanota.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_divide_and_conquer;

class Hanota {
    /**
     * Move a single disk from one pillar to another
     */
    private static function move(src: Array<Int>, tar: Array<Int>) {
        var pan = src.pop();
        tar.push(pan);
    }

    /**
     * Solve the Hanoi Tower problem recursively
     */
    private static function dfs(i: Int, src: Array<Int>, buf: Array<Int>, tar: Array<Int>) {
        // Base case: move the last disk directly
        if (i == 1) {
            move(src, tar);
            return;
        }
        // Step 1: Move top i-1 disks from source to buffer using target as auxiliary
        dfs(i - 1, src, tar, buf);
        // Step 2: Move the remaining largest disk from source to target
        move(src, tar);
        // Step 3: Move the i-1 disks from buffer to target using source as auxiliary
        dfs(i - 1, buf, src, tar);
    }

    /**
     * Entry point to solve the Hanoi Tower problem for n disks
     */
    public static function solveHanota(A: Array<Int>, B: Array<Int>, C: Array<Int>) {
        var n = A.length;
        dfs(n, A, B, C);
    }

    public static function main() {
        // Initialize pillars; larger numbers represent larger disks
        var A = [5, 4, 3, 2, 1];
        var B = new Array<Int>();
        var C = new Array<Int>();
        Sys.println("Initial state:");
        Sys.println("A = [" + A.join(", ") + "]");
        Sys.println("B = [" + B.join(", ") + "]");
        Sys.println("C = [" + C.join(", ") + "]");

        solveHanota(A, B, C);

        Sys.println("After moving disks:");
        Sys.println("A = [" + A.join(", ") + "]");
        Sys.println("B = [" + B.join(", ") + "]");
        Sys.println("C = [" + C.join(", ") + "]");
    }
}
