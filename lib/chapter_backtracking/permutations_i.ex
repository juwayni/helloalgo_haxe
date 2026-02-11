defmodule HelloAlgo.ChapterBacktracking.PermutationsI do
  @moduledoc """
  File: PermutationsI.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Backtracking algorithm to find all permutations of unique elements
  """
  def backtrack(state, choices, selected, res) do
    # Check if a solution is reached (all elements selected)
    if length(state) == length(choices) do
      res ++ [state]
    else
      # Iterate through all available choices
      Enum.with_index(choices)
      |> Enum.reduce(res, fn {choice, i}, current_res ->
        # Pruning: skip already selected elements
        if not MapSet.member?(selected, i) do
          # Make choice: add current index to selected and element to state
          next_selected = MapSet.put(selected, i)
          next_state = state ++ [choice]

          # Recurse
          updated_res = backtrack(next_state, choices, next_selected, current_res)

          # Undo choice: Implicit in functional Elixir (state/selected not mutated)
          updated_res
        else
          current_res
        end
      end)
    end
  end

  @doc """
  Generate all permutations
  """
  def permutations(nums) do
    backtrack([], nums, MapSet.new(), [])
  end

  def run() do
    nums = [1, 2, 3]

    res = permutations(nums)

    IO.puts("Input array nums = [#{Enum.join(nums, ", ")}]")
    IO.puts("Output all permutations")
    Enum.each(res, fn p ->
      IO.puts("[#{Enum.join(p, ", ")}]")
    end)
  end
end
