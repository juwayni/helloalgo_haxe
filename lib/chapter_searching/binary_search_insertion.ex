defmodule HelloAlgo.ChapterSearching.BinarySearchInsertion do
  @moduledoc """
  File: BinarySearchInsertion.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Find insertion point for target in a sorted array without duplicates
  """
  def binary_search_insertion_simple(nums, target) do
    # Double closed interval [0, n-1]
    do_binary_search_insertion_simple(nums, target, 0, length(nums) - 1)
  end

  # target not found, i is the correct insertion index
  defp do_binary_search_insertion_simple(_nums, _target, i, j) when i > j, do: i

  defp do_binary_search_insertion_simple(nums, target, i, j) do
    # Midpoint
    m = i + div(j - i, 2)
    val_m = Enum.at(nums, m)

    cond do
      val_m < target ->
        # target is in [m+1, j]
        do_binary_search_insertion_simple(nums, target, m + 1, j)

      val_m > target ->
        # target is in [i, m-1]
        do_binary_search_insertion_simple(nums, target, i, m - 1)

      true ->
        # target found, insertion point is m
        m
    end
  end

  @doc """
  Find the leftmost insertion point for target in a sorted array with potential duplicates
  """
  def binary_search_insertion(nums, target) do
    do_binary_search_insertion(nums, target, 0, length(nums) - 1)
  end

  # i will point to the first element >= target
  defp do_binary_search_insertion(_nums, _target, i, j) when i > j, do: i

  defp do_binary_search_insertion(nums, target, i, j) do
    m = i + div(j - i, 2)
    val_m = Enum.at(nums, m)

    if val_m < target do
      # target is in [m+1, j]
      do_binary_search_insertion(nums, target, m + 1, j)
    else
      # val_m >= target, search left to find leftmost
      # target found, but we want the leftmost index, so search left
      do_binary_search_insertion(nums, target, i, m - 1)
    end
  end

  def run() do
    # Test case 1: No duplicate elements
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]
    IO.puts("\nArray nums = [#{Enum.join(nums, ", ")}]")
    targets = [6, 9]

    for target <- targets do
      index = binary_search_insertion_simple(nums, target)
      IO.puts("Insertion point for element #{target} is index #{index}")
    end

    # Test case 2: Duplicate elements exist
    nums = [1, 3, 6, 6, 6, 6, 6, 10, 12, 15]
    IO.puts("\nArray nums = [#{Enum.join(nums, ", ")}]")
    targets2 = [2, 6, 20]

    for target <- targets2 do
      index = binary_search_insertion(nums, target)
      IO.puts("Insertion point for element #{target} is index #{index}")
    end
  end
end
