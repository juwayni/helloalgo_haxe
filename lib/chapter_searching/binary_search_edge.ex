defmodule HelloAlgo.ChapterSearching.BinarySearchEdge do
  @moduledoc """
  File: BinarySearchEdge.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  alias HelloAlgo.ChapterSearching.BinarySearchInsertion

  @doc """
  Binary search to find the index of the leftmost occurrence of target
  """
  def binary_search_left_edge(nums, target) do
    # Use the insertion point algorithm to find the leftmost index
    i = BinarySearchInsertion.binary_search_insertion(nums, target)
    # If index is valid and matches target, return it; otherwise return -1
    if i < length(nums) and Enum.at(nums, i) == target do
      i
    else
      -1
    end
  end

  @doc """
  Binary search to find the index of the rightmost occurrence of target
  """
  def binary_search_right_edge(nums, target) do
    # Finding the rightmost target is equivalent to finding the insertion point of (target + 1) minus 1
    i = BinarySearchInsertion.binary_search_insertion(nums, target + 1)
    j = i - 1

    # If index is valid and matches target, return it; otherwise return -1
    if j >= 0 and Enum.at(nums, j) == target do
      j
    else
      -1
    end
  end

  def run() do
    # Example array with multiple occurrences of the same values
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    IO.puts("\nArray nums = [#{Enum.join(nums, ", ")}]")

    # Test search for values 6 and 7
    targets = [6, 7]

    for target <- targets do
      index_left = binary_search_left_edge(nums, target)
      IO.puts("Index of the leftmost element #{target} is #{index_left}")
      index_right = binary_search_right_edge(nums, target)
      IO.puts("Index of the rightmost element #{target} is #{index_right}")
    end
  end
end
