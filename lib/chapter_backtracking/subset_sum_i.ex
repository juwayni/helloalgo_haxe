defmodule HelloAlgo.ChapterBacktracking.SubsetSumI do
  @moduledoc """
  File: SubsetSumI.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Efficient backtracking for subset sum (avoiding duplicate combinations)
  """
  def backtrack(state, target, choices, start, res) do
    # Solution check: target reached 0
    if target == 0 do
      res ++ [state]
    else
      # Iterate through choices starting from 'start' to avoid duplicates
      Enum.slice(choices, start..-1//1)
      |> Enum.with_index(start)
      |> Enum.reduce(res, fn {choice, i}, current_res ->
        # Pruning: if current choice exceeds remaining target, stop (optimization: sorted array)
        if target - choice < 0 do
          current_res
        else
          # Make choice
          next_state = state ++ [choice]
          # Recurse: pass current index 'i' to allow reusing the same element
          backtrack(next_state, target - choice, choices, i, current_res)
        end
      end)
    end
  end

  @doc """
  Find subsets that sum to target (allowing reuse of elements)
  """
  def subset_sum_i(nums, target) do
    # Sorting allows for early pruning
    backtrack([], target, Enum.sort(nums), 0, [])
  end

  def run() do
    nums = [3, 4, 5]
    target = 9

    res = subset_sum_i(nums, target)

    IO.puts("Input array nums = [#{Enum.join(nums, ", ")}], target = #{target}")
    IO.puts("Output subsets (no duplicate solutions)")
    Enum.each(res, fn p ->
      IO.puts("[#{Enum.join(p, ", ")}]")
    end)
  end
end
