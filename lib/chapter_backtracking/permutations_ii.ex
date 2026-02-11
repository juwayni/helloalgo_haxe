defmodule HelloAlgo.ChapterBacktracking.PermutationsII do
  @moduledoc """
  File: PermutationsII.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Backtracking algorithm to find all permutations with duplicate elements
  """
  def backtrack(state, choices, selected, res) do
    # Check if a solution is reached
    if length(state) == length(choices) do
      res ++ [state]
    else
      # Track duplicates at the current recursion level
      # This ensures we don't pick the same value twice for the same position
      duplicated = MapSet.new()

      Enum.with_index(choices)
      |> Enum.reduce({res, duplicated}, fn {choice, i}, {current_res, current_dup} ->
        # Pruning: skip if index already used OR value already tried at this level
        if not MapSet.member?(selected, i) and not MapSet.member?(current_dup, choice) do
          # Make choice
          next_selected = MapSet.put(selected, i)
          next_state = state ++ [choice]
          next_dup = MapSet.put(current_dup, choice)

          # Recurse
          updated_res = backtrack(next_state, choices, next_selected, current_res)

          {updated_res, next_dup}
        else
          {current_res, current_dup}
        end
      end)
      |> elem(0)
    end
  end

  @doc """
  Generate all permutations (handling duplicates)
  """
  def permutations(nums) do
    backtrack([], nums, MapSet.new(), [])
  end

  def run() do
    nums = [1, 2, 2]

    res = permutations(nums)

    IO.puts("Input array nums = [#{Enum.join(nums, ", ")}]")
    IO.puts("Output all permutations")
    Enum.each(res, fn p ->
      IO.puts("[#{Enum.join(p, ", ")}]")
    end)
  end
end
