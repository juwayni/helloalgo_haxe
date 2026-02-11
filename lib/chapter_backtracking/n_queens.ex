defmodule HelloAlgo.ChapterBacktracking.NQueens do
  @moduledoc """
  File: NQueens.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Backtracking to solve N-Queens problem
  """
  def backtrack(row, n, state, cols, diags1, diags2, res) do
    # Base case: all rows placed
    if row == n do
      # Record solution: format board from state
      board = Enum.map(state, fn r ->
        Enum.map(0..(n-1), fn c -> if Enum.at(r, c) == "Q", do: "Q", else: "." end)
      end)
      res ++ [board]
    else
      # Try placing queen in each column of current row
      Enum.reduce(0..(n - 1), res, fn col, current_res ->
        # Calculate diagonal indices
        diag1 = row - col
        diag2 = row + col

        # Pruning: check if column or diagonals are already occupied
        if not MapSet.member?(cols, col) and
           not MapSet.member?(diags1, diag1) and
           not MapSet.member?(diags2, diag2) do

          # Make choice
          new_row_str = List.duplicate(".", n) |> List.replace_at(col, "Q")
          next_state = state ++ [new_row_str]
          next_cols = MapSet.put(cols, col)
          next_diags1 = MapSet.put(diags1, diag1)
          next_diags2 = MapSet.put(diags2, diag2)

          # Recurse
          backtrack(row + 1, n, next_state, next_cols, next_diags1, next_diags2, current_res)
        else
          current_res
        end
      end)
    end
  end

  @doc """
  Solve N-Queens
  """
  def n_queens(n) do
    backtrack(0, n, [], MapSet.new(), MapSet.new(), MapSet.new(), [])
  end

  def run() do
    n = 4
    res = n_queens(n)

    IO.puts("N = #{n} Queens problem solutions: #{length(res)}")
    Enum.each(res, fn sol ->
      IO.puts("--------------------")
      Enum.each(sol, fn row ->
        IO.puts(Enum.join(row, " "))
      end)
    end)
  end
end
