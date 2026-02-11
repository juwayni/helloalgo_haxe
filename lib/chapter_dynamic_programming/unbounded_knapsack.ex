defmodule HelloAlgo.ChapterDynamicProgramming.UnboundedKnapsack do
  @moduledoc """
  File: UnboundedKnapsack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Unbounded Knapsack: Dynamic Programming
  """
  def unbounded_knapsack_dp(wgt, val, cap) do
    n = length(wgt)
    dp = Enum.map(0..n, fn _ -> List.duplicate(0, cap + 1) end)

    dp = Enum.reduce(1..n, dp, fn i, acc_i ->
      Enum.reduce(1..cap, acc_i, fn c, acc_c ->
        if Enum.at(wgt, i - 1) > c do
          prev_val = Enum.at(Enum.at(acc_c, i - 1), c)
          row = Enum.at(acc_c, i)
          List.replace_at(acc_c, i, List.replace_at(row, c, prev_val))
        else
          no = Enum.at(Enum.at(acc_c, i - 1), c)
          # Note: uses dp[i][c-wgt] instead of dp[i-1][c-wgt]
          yes = Enum.at(Enum.at(acc_c, i), c - Enum.at(wgt, i - 1)) + Enum.at(val, i - 1)
          row = Enum.at(acc_c, i)
          List.replace_at(acc_c, i, List.replace_at(row, c, max(no, yes)))
        end
      end)
    end)
    Enum.at(Enum.at(dp, n), cap)
  end

  @doc """
  Unbounded Knapsack: Space-optimized DP
  """
  def unbounded_knapsack_dp_comp(wgt, val, cap) do
    dp = List.duplicate(0, cap + 1)
    Enum.reduce(Enum.zip(wgt, val), dp, fn {w, v}, acc_wgt ->
      Enum.reduce(w..cap//1, acc_wgt, fn c, acc_c ->
        List.replace_at(acc_c, c, max(Enum.at(acc_c, c), Enum.at(acc_c, c - w) + v))
      end)
    end)
    |> Enum.at(cap)
  end

  def run() do
    wgt = [1, 2, 3]
    val = [5, 11, 15]
    cap = 4
    IO.puts("Weights = #{inspect(wgt)}, Values = #{inspect(val)}, Capacity = #{cap}")

    res = unbounded_knapsack_dp(wgt, val, cap)
    IO.puts("Max value (DP) = #{res}")

    res_comp = unbounded_knapsack_dp_comp(wgt, val, cap)
    IO.puts("Max value (optimized) = #{res_comp}")
  end
end
