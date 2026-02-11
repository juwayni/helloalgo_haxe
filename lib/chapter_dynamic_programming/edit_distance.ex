defmodule HelloAlgo.ChapterDynamicProgramming.EditDistance do
  @moduledoc """
  File: EditDistance.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Edit distance: DFS (recursion)
  """
  def edit_distance_dfs(s, t, i, j) do
    # Base cases: one string is empty
    cond do
      i == 0 -> j
      j == 0 -> i
      # If characters match, no operation needed
      String.at(s, i - 1) == String.at(t, j - 1) ->
        edit_distance_dfs(s, t, i - 1, j - 1)
      true ->
        # Try insert, delete, and replace operations
        insert = edit_distance_dfs(s, t, i, j - 1)
        delete = edit_distance_dfs(s, t, i - 1, j)
        replace = edit_distance_dfs(s, t, i - 1, j - 1)
        min(min(insert, delete), replace) + 1
    end
  end

  @doc """
  Edit distance: DFS with memoization
  """
  def edit_distance_dfs_mem(s, t, i, j, mem) do
    cond do
      i == 0 -> {j, mem}
      j == 0 -> {i, mem}
      Map.has_key?(mem, {i, j}) -> {Map.get(mem, {i, j}), mem}
      String.at(s, i - 1) == String.at(t, j - 1) ->
        {res, mem} = edit_distance_dfs_mem(s, t, i - 1, j - 1, mem)
        mem = Map.put(mem, {i, j}, res)
        {res, mem}
      true ->
        {insert, mem} = edit_distance_dfs_mem(s, t, i, j - 1, mem)
        {delete, mem} = edit_distance_dfs_mem(s, t, i - 1, j, mem)
        {replace, mem} = edit_distance_dfs_mem(s, t, i - 1, j - 1, mem)
        res = min(min(insert, delete), replace) + 1
        mem = Map.put(mem, {i, j}, res)
        {res, mem}
    end
  end

  @doc """
  Edit distance: Dynamic Programming
  """
  def edit_distance_dp(s, t) do
    n = String.length(s)
    m = String.length(t)
    # dp[i][j] represents the edit distance between s[0..i-1] and t[0..j-1]
    dp = Enum.map(0..n, fn i ->
      Enum.map(0..m, fn j ->
        cond do
          i == 0 -> j
          j == 0 -> i
          true -> 0
        end
      end)
    end)

    dp = Enum.reduce(1..n, dp, fn i, acc_i ->
      Enum.reduce(1..m, acc_i, fn j, acc_j ->
        if String.at(s, i - 1) == String.at(t, j - 1) do
          val = Enum.at(Enum.at(acc_j, i - 1), j - 1)
          row = Enum.at(acc_j, i)
          List.replace_at(acc_j, i, List.replace_at(row, j, val))
        else
          insert = Enum.at(Enum.at(acc_j, i), j - 1)
          delete = Enum.at(Enum.at(acc_j, i - 1), j)
          replace = Enum.at(Enum.at(acc_j, i - 1), j - 1)
          val = min(min(insert, delete), replace) + 1
          row = Enum.at(acc_j, i)
          List.replace_at(acc_j, i, List.replace_at(row, j, val))
        end
      end)
    end)
    Enum.at(Enum.at(dp, n), m)
  end

  def run() do
    s = "kitten"
    t = "sitting"
    IO.puts("String s = #{s}")
    IO.puts("String t = #{t}")

    res = edit_distance_dp(s, t)
    IO.puts("Edit distance (DP) = #{res}")

    {res_mem, _} = edit_distance_dfs_mem(s, t, String.length(s), String.length(t), %{})
    IO.puts("Edit distance (Memoization) = #{res_mem}")
  end
end
