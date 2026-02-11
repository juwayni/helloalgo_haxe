defmodule HelloAlgo.ChapterDynamicProgramming.MinCostClimbingStairsDp do
  @moduledoc """
  File: MinCostClimbingStairsDp.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Minimum cost climbing stairs using DP
  """
  def min_cost_climbing_stairs_dp(cost) do
    n = length(cost) - 1
    if n == 1 do
      Enum.at(cost, 1)
    else
      dp = List.duplicate(0, n + 1)
      dp = List.replace_at(dp, 1, Enum.at(cost, 1))
      dp = List.replace_at(dp, 2, Enum.at(cost, 2))
      Enum.reduce(3..n, dp, fn i, acc ->
        List.replace_at(acc, i, min(Enum.at(acc, i - 1), Enum.at(acc, i - 2)) + Enum.at(cost, i))
      end)
      |> Enum.at(n)
    end
  end

  def run() do
    cost = [0, 1, 10, 1, 1, 1, 10, 1, 1, 10, 1]
    res = min_cost_climbing_stairs_dp(cost)
    IO.puts("Minimum cost to reach the top = #{res}")
  end
end
