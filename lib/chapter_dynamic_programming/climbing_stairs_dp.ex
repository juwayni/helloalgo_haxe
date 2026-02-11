defmodule HelloAlgo.ChapterDynamicProgramming.ClimbingStairsDp do
  @moduledoc """
  File: ClimbingStairsDp.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Dynamic programming for climbing stairs
  """
  def climbing_stairs_dp(n) do
    if n == 1 or n == 2 do
      n
    else
      dp = List.duplicate(0, n + 1)
      dp = List.replace_at(dp, 1, 1)
      dp = List.replace_at(dp, 2, 2)
      Enum.reduce(3..n, dp, fn i, acc ->
        List.replace_at(acc, i, Enum.at(acc, i - 1) + Enum.at(acc, i - 2))
      end)
      |> Enum.at(n)
    end
  end

  @doc """
  Space-optimized DP
  """
  def climbing_stairs_dp_comp(n) do
    if n == 1 or n == 2 do
      n
    else
      {_a, b} = Enum.reduce(3..n, {1, 2}, fn _i, {a, b} -> {b, a + b} end)
      b
    end
  end

  def run() do
    n = 9
    res = climbing_stairs_dp(n)
    IO.puts("Climbing #{n} stairs, total solutions = #{res}")
  end
end
