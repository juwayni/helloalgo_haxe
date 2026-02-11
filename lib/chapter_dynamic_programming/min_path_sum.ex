defmodule HelloAlgo.ChapterDynamicProgramming.MinPathSum do
  @moduledoc """
  File: MinPathSum.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Minimum path sum using dynamic programming
  """
  def min_path_sum_dp(grid) do
    n = length(grid)
    m = length(Enum.at(grid, 0))
    dp = Enum.map(0..(n - 1), fn _ -> List.duplicate(0, m) end)
    row0 = Enum.at(dp, 0) |> List.replace_at(0, Enum.at(Enum.at(grid, 0), 0))
    dp = List.replace_at(dp, 0, row0)

    dp = Enum.reduce(1..(m - 1), dp, fn j, acc ->
      row = Enum.at(acc, 0)
      new_val = Enum.at(row, j - 1) + Enum.at(Enum.at(grid, 0), j)
      List.replace_at(acc, 0, List.replace_at(row, j, new_val))
    end)

    dp = Enum.reduce(1..(n - 1), dp, fn i, acc ->
      prev_row = Enum.at(acc, i - 1)
      curr_row = Enum.at(acc, i)
      new_val = Enum.at(prev_row, 0) + Enum.at(Enum.at(grid, i), 0)
      List.replace_at(acc, i, List.replace_at(curr_row, 0, new_val))
    end)

    dp = Enum.reduce(1..(n - 1), dp, fn i, acc_i ->
      Enum.reduce(1..(m - 1), acc_i, fn j, acc_j ->
        curr_row = Enum.at(acc_j, i)
        up = Enum.at(Enum.at(acc_j, i - 1), j)
        left = Enum.at(curr_row, j - 1)
        new_val = min(up, left) + Enum.at(Enum.at(grid, i), j)
        List.replace_at(acc_j, i, List.replace_at(curr_row, j, new_val))
      end)
    end)
    Enum.at(Enum.at(dp, n - 1), m - 1)
  end

  def run() do
    grid = [[1, 3, 1], [1, 5, 1], [4, 2, 1]]
    res = min_path_sum_dp(grid)
    IO.puts("Minimum path sum = #{res}")
  end
end
