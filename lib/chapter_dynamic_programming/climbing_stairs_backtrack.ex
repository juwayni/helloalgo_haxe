defmodule HelloAlgo.ChapterDynamicProgramming.ClimbingStairsBacktrack do
  @moduledoc """
  File: ClimbingStairsBacktrack.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Backtracking to solve climbing stairs
  """
  def backtrack(choices, state, n, res) do
    # Solution reached: current sum equals n
    if state == n do
      res + 1
    else
      # Try each choice (climb 1 or 2 steps)
      Enum.reduce(choices, res, fn choice, current_res ->
        # Pruning: skip if choice exceeds remaining steps
        if state + choice <= n do
          # Make choice and recurse
          backtrack(choices, state + choice, n, current_res)
        else
          current_res
        end
      end)
    end
  end

  @doc """
  Climbing stairs (backtracking)
  """
  def climbing_stairs_backtrack(n) do
    choices = [1, 2]
    state = 0
    backtrack(choices, state, n, 0)
  end

  def run() do
    n = 9
    res = climbing_stairs_backtrack(n)
    IO.puts("Climbing #{n} stairs, total solutions = #{res}")
  end
end
