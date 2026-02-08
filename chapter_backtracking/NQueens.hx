/**
 * File: NQueens.hx
 * Created Time: 2026-02-08
 * Author: Ghazali (ghazalialshafi@gmail.com)
 */

package chapter_backtracking;

class NQueens {
    /**
     * Backtracking algorithm to solve n-queens problem
     */
    private static function backtrack(
        row: Int,
        n: Int,
        state: Array<Array<String>>,
        res: Array<Array<Array<String>>>,
        cols: Array<Bool>,
        diags1: Array<Bool>,
        diags2: Array<Bool>
    ) {
        // When all rows are placed, record the solution
        if (row == n) {
            var copy = new Array<Array<String>>();
            for (i in 0...n) {
                copy.push(state[i].copy());
            }
            res.push(copy);
            return;
        }
        // Traverse all columns in the current row
        for (col in 0...n) {
            // Calculate corresponding diagonals for the current (row, col) position
            var diag1 = row - col + n - 1;
            var diag2 = row + col;
            // Pruning: ensure no queen in current column or diagonals
            if (!cols[col] && !diags1[diag1] && !diags2[diag2]) {
                // Try: place queen
                state[row][col] = "Q";
                cols[col] = true;
                diags1[diag1] = true;
                diags2[diag2] = true;
                // Place queen in the next row
                backtrack(row + 1, n, state, res, cols, diags1, diags2);
                // Backtrack: remove queen and restore state
                state[row][col] = "#";
                cols[col] = false;
                diags1[diag1] = false;
                diags2[diag2] = false;
            }
        }
    }

    /**
     * Solve the n-queens problem and return all possible board configurations
     */
    public static function nQueens(n: Int): Array<Array<Array<String>>> {
        // Initialize an empty n x n board
        var state = new Array<Array<String>>();
        for (i in 0...n) {
            var row = new Array<String>();
            for (j in 0...n) {
                row.push("#");
            }
            state.push(row);
        }

        // Track occupied columns and diagonals
        var cols = new Array<Bool>();
        for (i in 0...n) cols.push(false);
        var diags1 = new Array<Bool>();
        for (i in 0...2 * n - 1) diags1.push(false);
        var diags2 = new Array<Bool>();
        for (i in 0...2 * n - 1) diags2.push(false);

        var res = new Array<Array<Array<String>>>();
        backtrack(0, n, state, res, cols, diags1, diags2);
        return res;
    }

    public static function main() {
        var n = 4;
        var res = nQueens(n);
        Sys.println("Input board size = " + n);
        Sys.println("Number of solutions = " + res.length);
        for (state in res) {
            Sys.println("--------------------");
            for (row in state) {
                Sys.println("[" + row.join(", ") + "]");
            }
        }
    }
}
