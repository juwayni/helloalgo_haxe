defmodule HelloAlgo.ChapterSearching.BinarySearch do
  @moduledoc """
  File: BinarySearch.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Binary search using double closed interval [0, n-1]
  """
  def binary_search(nums, target) do
    # Initialize left and right pointers
    do_binary_search(nums, target, 0, length(nums) - 1)
  end

  # Search until the range is empty
  defp do_binary_search(_nums, _target, i, j) when i > j, do: -1

  defp do_binary_search(nums, target, i, j) do
    # Calculate midpoint index m
    m = i + div(j - i, 2)
    val_m = Enum.at(nums, m)

    cond do
      val_m < target ->
        # target is in the right half [m+1, j]
        do_binary_search(nums, target, m + 1, j)

      val_m > target ->
        # target is in the left half [i, m-1]
        do_binary_search(nums, target, i, m - 1)

      true ->
        # Found target at index m
        m
    end
  end

  @doc """
  Binary search using left-closed right-open interval [0, n)
  """
  def binary_search_lcro(nums, target) do
    # Initialize left pointer and right boundary
    do_binary_search_lcro(nums, target, 0, length(nums))
  end

  # Search until the range is empty (i == j)
  defp do_binary_search_lcro(_nums, _target, i, j) when i >= j, do: -1

  defp do_binary_search_lcro(nums, target, i, j) do
    # Calculate midpoint index m
    m = i + div(j - i, 2)
    val_m = Enum.at(nums, m)

    cond do
      val_m < target ->
        # target is in the range [m+1, j)
        do_binary_search_lcro(nums, target, m + 1, j)

      val_m > target ->
        # target is in the range [i, m)
        do_binary_search_lcro(nums, target, i, m)

      true ->
        # Found target at index m
        m
    end
  end

  def run() do
    target = 6
    nums = [1, 3, 6, 8, 12, 15, 23, 26, 31, 35]

    # Perform binary search (double closed interval)
    index = binary_search(nums, target)
    IO.puts("Index of target element 6 = #{index}")

    # Perform binary search (left-closed right-open interval)
    index = binary_search_lcro(nums, target)
    IO.puts("Index of target element 6 = #{index}")
  end
end
