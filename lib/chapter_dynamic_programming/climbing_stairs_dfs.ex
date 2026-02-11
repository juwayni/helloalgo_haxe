defmodule HelloAlgo.ChapterDynamicProgramming.ClimbingStairsDfs do
  @moduledoc """
  File: ClimbingStairsDfs.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  DFS (recursion) to solve climbing stairs
  """
  def dfs(i) do
    if i == 1 or i == 2, do: i, else: dfs(i - 1) + dfs(i - 2)
  end

  def climbing_stairs_dfs(n), do: dfs(n)

  def run() do
    n = 9
    res = climbing_stairs_dfs(n)
    IO.puts("Climbing #{n} stairs, total solutions = #{res}")
  end
end
