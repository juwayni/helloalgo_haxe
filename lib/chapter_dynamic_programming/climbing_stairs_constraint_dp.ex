defmodule HelloAlgo.ChapterDynamicProgramming.ClimbingStairsConstraintDp do
  @moduledoc """
  File: ClimbingStairsConstraintDp.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Climbing stairs with constraint: cannot take two 1-step climbs in a row
  """
  def climbing_stairs_constraint_dp(n) do
    if n == 1 or n == 2 do
      1
    else
      # dp[i][1] - ways to reach stair i with last step 1
      # dp[i][2] - ways to reach stair i with last step 2
      dp = Enum.map(0..n, fn _ -> [0, 0, 0] end)

      # Base cases
      dp = List.replace_at(dp, 1, [0, 1, 0])
      dp = List.replace_at(dp, 2, [0, 0, 1])

      # State transitions
      Enum.reduce(3..n, dp, fn i, acc ->
        # To take a 1-step climb, the previous step must have been 2
        dp_i_1 = Enum.at(Enum.at(acc, i - 1), 2)
        # To take a 2-step climb, the previous step could be 1 or 2
        dp_i_2 = Enum.at(Enum.at(acc, i - 2), 1) + Enum.at(Enum.at(acc, i - 2), 2)

        List.replace_at(acc, i, [0, dp_i_1, dp_i_2])
      end)
      |> (fn res ->
        final_row = Enum.at(res, n)
        Enum.at(final_row, 1) + Enum.at(final_row, 2)
      end).()
    end
  end

  def run() do
    n = 9
    res = climbing_stairs_constraint_dp(n)
    IO.puts("Climbing #{n} stairs with constraint (no consecutive 1s) = #{res}")
  end
end
