defmodule HelloAlgo.ChapterBacktracking.SubsetSumINaive do
  @moduledoc """
  File: SubsetSumINaive.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Naive backtracking for subset sum (explores duplicates unnecessarily)
  """
  def backtrack(state, target, total, choices, res) do
    # Solution check: sum equals target
    res = if total == target, do: res ++ [state], else: res

    # Iterate through all choices
    Enum.with_index(choices)
    |> Enum.reduce(res, fn {choice, i}, current_res ->
      # Pruning: if adding choice exceeds target, stop
      if total + choice <= target do
        # Make choice
        next_state = state ++ [choice]
        # Recurse
        backtrack(next_state, target, total + choice, choices, current_res)
      else
        current_res
      end
    end)
  end

  @doc """
  Find subsets that sum to target
  """
  def subset_sum_i_naive(nums, target) do
    backtrack([], target, 0, Enum.sort(nums), [])
  end

  def run() do
    nums = [3, 4, 5]
    target = 9

    res = subset_sum_i_naive(nums, target)

    IO.puts("Input array nums = [#{Enum.join(nums, ", ")}], target = #{target}")
    IO.puts("Output subsets (contains duplicate solutions)")
    Enum.each(res, fn p ->
      IO.puts("[#{Enum.join(p, ", ")}]")
    end)
    IO.puts("Note: This naive version explores duplicate paths and is inefficient.")
  end
end
