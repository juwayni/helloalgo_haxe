defmodule HelloAlgo.ChapterSorting.MergeSort do
  @moduledoc """
  File: MergeSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Merge two sorted lists.
  """
  def merge(left_list, right_list) do
    # Compare elements from both sub-arrays and copy the smaller one
    do_merge(left_list, right_list, [])
  end

  # Copy any remaining elements from either list
  defp do_merge([], right, acc), do: acc ++ right
  defp do_merge(left, [], acc), do: acc ++ left
  defp do_merge([l | left_rest], [r | _right_rest] = right, acc) when l <= r do
    do_merge(left_rest, right, acc ++ [l])
  end
  defp do_merge(left, [r | right_rest], acc) do
    do_merge(left, right_rest, acc ++ [r])
  end

  @doc """
  Recursive merge sort algorithm (O(n log n))
  """
  def merge_sort([]), do: []
  def merge_sort([_] = list), do: list
  def merge_sort(nums) do
    # Divide: calculate midpoint
    mid = div(length(nums), 2)
    {left, right} = Enum.split(nums, mid)

    # Conquer: sort both halves
    sorted_left = merge_sort(left)
    sorted_right = merge_sort(right)

    # Combine: merge the sorted halves
    merge(sorted_left, sorted_right)
  end

  def run() do
    var_nums = [7, 3, 2, 6, 0, 1, 5, 4]
    sorted_nums = merge_sort(var_nums)
    IO.puts("After merge sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
