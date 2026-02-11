defmodule HelloAlgo.ChapterDynamicProgramming.ClimbingStairsDfsMem do
  @moduledoc """
  File: ClimbingStairsDfsMem.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  DFS with memoization
  """
  def dfs(i, mem) do
    if i == 1 or i == 2 do
      {i, mem}
    else
      if Map.has_key?(mem, i) do
        {Map.get(mem, i), mem}
      else
        {count_1, mem} = dfs(i - 1, mem)
        {count_2, mem} = dfs(i - 2, mem)
        res = count_1 + count_2
        mem = Map.put(mem, i, res)
        {res, mem}
      end
    end
  end

  def climbing_stairs_dfs_mem(n) do
    {res, _mem} = dfs(n, %{})
    res
  end

  def run() do
    n = 9
    res = climbing_stairs_dfs_mem(n)
    IO.puts("Climbing #{n} stairs, total solutions = #{res}")
  end
end
