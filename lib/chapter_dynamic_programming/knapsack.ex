defmodule HelloAlgo.ChapterDynamicProgramming.Knapsack do
  @moduledoc """
  File: Knapsack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  0/1 Knapsack: DFS (recursion)
  """
  def knapsack_dfs(w, v, i, c) do
    # Base case: no items left or no capacity
    if i == 0 or c == 0 do
      0
    else
      # If current item exceeds capacity, skip it
      if Enum.at(w, i - 1) > c do
        knapsack_dfs(w, v, i - 1, c)
      else
        # Decision: either don't take the item or take it
        no = knapsack_dfs(w, v, i - 1, c)
        yes = knapsack_dfs(w, v, i - 1, c - Enum.at(w, i - 1)) + Enum.at(v, i - 1)
        max(no, yes)
      end
    end
  end

  @doc """
  0/1 Knapsack: DFS with memoization
  """
  def knapsack_dfs_mem(w, v, i, c, mem) do
    if i == 0 or c == 0 do
      {0, mem}
    else
      if Map.has_key?(mem, {i, c}) do
        {Map.get(mem, {i, c}), mem}
      else
        if Enum.at(w, i - 1) > c do
          knapsack_dfs_mem(w, v, i - 1, c, mem)
        else
          {no, mem} = knapsack_dfs_mem(w, v, i - 1, c, mem)
          {yes, mem} = knapsack_dfs_mem(w, v, i - 1, c - Enum.at(w, i - 1), mem)
          res = max(no, yes + Enum.at(v, i - 1))
          mem = Map.put(mem, {i, c}, res)
          {res, mem}
        end
      end
    end
  end

  @doc """
  0/1 Knapsack: Dynamic Programming
  """
  def knapsack_dp(w, v, cap) do
    n = length(w)
    # dp[i][c] represents the max value with first i items and capacity c
    dp = Enum.map(0..n, fn _ -> List.duplicate(0, cap + 1) end)

    dp = Enum.reduce(1..n, dp, fn i, acc_i ->
      Enum.reduce(1..cap, acc_i, fn c, acc_c ->
        if Enum.at(w, i - 1) > c do
          # Cannot take item i
          prev_val = Enum.at(Enum.at(acc_c, i - 1), c)
          row = Enum.at(acc_c, i)
          List.replace_at(acc_c, i, List.replace_at(row, c, prev_val))
        else
          # Decide whether to take item i
          no = Enum.at(Enum.at(acc_c, i - 1), c)
          yes = Enum.at(Enum.at(acc_c, i - 1), c - Enum.at(w, i - 1)) + Enum.at(v, i - 1)
          row = Enum.at(acc_c, i)
          List.replace_at(acc_c, i, List.replace_at(row, c, max(no, yes)))
        end
      end)
    end)
    Enum.at(Enum.at(dp, n), cap)
  end

  @doc """
  0/1 Knapsack: Space-optimized DP
  """
  def knapsack_dp_comp(w, v, cap) do
    n = length(w)
    # Use 1D array, iterating backwards to avoid using same item twice
    dp = List.duplicate(0, cap + 1)
    Enum.reduce(1..n, dp, fn i, acc_i ->
      Enum.reduce(cap..Enum.at(w, i - 1)//-1, acc_i, fn c, acc_c ->
        max_val = max(Enum.at(acc_c, c), Enum.at(acc_c, c - Enum.at(w, i - 1)) + Enum.at(v, i - 1))
        List.replace_at(acc_c, c, max_val)
      end)
    end)
    |> Enum.at(cap)
  end

  def run() do
    w = [10, 20, 30]
    v = [60, 100, 120]
    cap = 50
    n = length(w)

    IO.puts("Weights = #{inspect(w)}")
    IO.puts("Values = #{inspect(v)}")
    IO.puts("Capacity = #{cap}")

    res = knapsack_dp(w, v, cap)
    IO.puts("Knapsack max value (DP) = #{res}")

    res_comp = knapsack_dp_comp(w, v, cap)
    IO.puts("Knapsack max value (optimized DP) = #{res_comp}")

    {res_mem, _} = knapsack_dfs_mem(w, v, n, cap, %{})
    IO.puts("Knapsack max value (Memoization) = #{res_mem}")
  end
end
