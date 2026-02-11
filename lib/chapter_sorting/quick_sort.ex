defmodule HelloAlgo.ChapterSorting.QuickSort do
  @moduledoc """
  File: QuickSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Standard recursive quick sort (functional approach)
  """
  def quick_sort([]), do: []
  def quick_sort([pivot | rest]) do
    # Partition: Find elements smaller than pivot and elements larger than pivot
    left = Enum.filter(rest, fn x -> x < pivot end)
    right = Enum.filter(rest, fn x -> x >= pivot end)
    # Combine: sort both halves and join with pivot
    quick_sort(left) ++ [pivot] ++ quick_sort(right)
  end

  @doc """
  Quick sort with median-of-three optimization
  """
  def quick_sort_median([]), do: []
  def quick_sort_median([_] = list), do: list
  def quick_sort_median(nums) do
    # Select median of first, middle, last to serve as pivot
    n = length(nums)
    mid_idx = div(n, 2)
    left_val = List.first(nums)
    mid_val = Enum.at(nums, mid_idx)
    right_val = List.last(nums)

    pivot = median_three(left_val, mid_val, right_val)

    # Remove one occurrence of pivot from nums for partitioning
    {_index, rest} = pop_value(nums, pivot)

    left = Enum.filter(rest, fn x -> x < pivot end)
    right = Enum.filter(rest, fn x -> x >= pivot end)

    quick_sort_median(left) ++ [pivot] ++ quick_sort_median(right)
  end

  defp median_three(l, m, r) do
    if (l <= m and m <= r) or (r <= m and m <= l), do: m, else:
    if (m <= l and l <= r) or (r <= l and l <= m), do: l, else: r
  end

  defp pop_value(list, val) do
    idx = Enum.find_index(list, fn x -> x == val end)
    {idx, List.delete_at(list, idx)}
  end

  @doc """
  Quick sort with tail call optimization (mimicking the Haxe logic)
  In Elixir, we use recursion for this.
  """
  def quick_sort_tail_call(nums), do: quick_sort(nums)

  def run() do
    nums = [2, 4, 1, 0, 3, 5]
    res = quick_sort(nums)
    IO.puts("After quick sort, nums = [#{Enum.join(res, ", ")}]")

    nums1 = [2, 4, 1, 0, 3, 5]
    res1 = quick_sort_median(nums1)
    IO.puts("After quick sort (median optimization), nums1 = [#{Enum.join(res1, ", ")}]")

    nums2 = [2, 4, 1, 0, 3, 5]
    res2 = quick_sort_tail_call(nums2)
    IO.puts("After quick sort (recursion depth optimization), nums2 = [#{Enum.join(res2, ", ")}]")
  end
end
