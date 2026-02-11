defmodule HelloAlgo.ChapterDivideAndConquer.BinarySearchRecur do
  @moduledoc """
  File: BinarySearchRecur.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Binary search using recursion (divide and conquer)
  """
  def dfs(nums, target, i, j) do
    # Base case: search range is empty
    if i > j do
      -1
    else
      # Calculate middle index
      m = i + div(j - i, 2)
      num_m = Enum.at(nums, m)

      cond do
        # Sub-problem: search left half
        num_m < target -> dfs(nums, target, m + 1, j)
        # Sub-problem: search right half
        num_m > target -> dfs(nums, target, i, m - 1)
        # Target found: return index
        true -> m
      end
    end
  end

  @doc """
  Binary search entry point
  """
  def binary_search(nums, target) do
    dfs(nums, target, 0, length(nums) - 1)
  end

  def run() do
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Recursive binary search
    index = binary_search(nums, target)
    IO.puts("Target index = #{index}")
  end
end
