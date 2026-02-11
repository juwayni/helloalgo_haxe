defmodule HelloAlgo.ChapterBacktracking.SubsetSumII do
  @moduledoc """
  File: SubsetSumII.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Backtracking for subset sum with duplicate elements (each element used once)
  """
  def backtrack(state, target, choices, start, res) do
    # Solution check
    if target == 0 do
      res ++ [state]
    else
      # Iterate through choices starting from 'start'
      Enum.slice(choices, start..-1//1)
      |> Enum.with_index(start)
      |> Enum.reduce(res, fn {choice, i}, current_res ->
        # Pruning: if current choice exceeds remaining target, stop
        # Pruning: skip duplicate values at the SAME recursion level
        cond do
          target - choice < 0 ->
            current_res
          i > start and Enum.at(choices, i) == Enum.at(choices, i - 1) ->
            current_res
          true ->
            # Make choice
            next_state = state ++ [choice]
            # Recurse: pass 'i + 1' to avoid using the same element index again
            backtrack(next_state, target - choice, choices, i + 1, current_res)
        end
      end)
    end
  end

  @doc """
  Find subsets that sum to target (handling duplicate elements)
  """
  def subset_sum_ii(nums, target) do
    # Sorting is essential for duplicate handling and pruning
    backtrack([], target, Enum.sort(nums), 0, [])
  end

  def run() do
    nums = [4, 4, 5]
    target = 9

    res = subset_sum_ii(nums, target)

    IO.puts("Input array nums = [#{Enum.join(nums, ", ")}], target = #{target}")
    IO.puts("Output subsets")
    Enum.each(res, fn p ->
      IO.puts("[#{Enum.join(p, ", ")}]")
    end)
  end
end
