defmodule HelloAlgo.ChapterSorting.BubbleSort do
  @moduledoc """
  File: BubbleSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Standard bubble sort algorithm (O(n^2))
  """
  def bubble_sort(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      # Outer loop defines the end of the unsorted portion
      do_bubble_sort(nums, n - 1)
    end
  end

  defp do_bubble_sort(nums, i) when i <= 0, do: nums

  defp do_bubble_sort(nums, i) do
    # Inner loop compares adjacent elements
    new_nums = bubble_pass(nums, 0, i)
    do_bubble_sort(new_nums, i - 1)
  end

  defp bubble_pass(nums, j, limit) when j >= limit, do: nums

  defp bubble_pass(nums, j, limit) do
    val_j = Enum.at(nums, j)
    val_j1 = Enum.at(nums, j + 1)

    if val_j > val_j1 do
      # Swap elements if they are in the wrong order
      new_nums =
        nums
        |> List.replace_at(j, val_j1)
        |> List.replace_at(j + 1, val_j)

      bubble_pass(new_nums, j + 1, limit)
    else
      bubble_pass(nums, j + 1, limit)
    end
  end

  @doc """
  Bubble sort with flag optimization to stop early if the array is sorted
  """
  def bubble_sort_with_flag(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      do_bubble_sort_with_flag(nums, n - 1)
    end
  end

  defp do_bubble_sort_with_flag(nums, i) when i <= 0, do: nums

  defp do_bubble_sort_with_flag(nums, i) do
    {new_nums, swapped} = bubble_pass_with_flag(nums, 0, i, false)

    # If no swaps occurred, the array is already sorted
    if not swapped do
      new_nums
    else
      do_bubble_sort_with_flag(new_nums, i - 1)
    end
  end

  defp bubble_pass_with_flag(nums, j, limit, swapped) when j >= limit, do: {nums, swapped}

  defp bubble_pass_with_flag(nums, j, limit, swapped) do
    val_j = Enum.at(nums, j)
    val_j1 = Enum.at(nums, j + 1)

    if val_j > val_j1 do
      new_nums =
        nums
        |> List.replace_at(j, val_j1)
        |> List.replace_at(j + 1, val_j)

      bubble_pass_with_flag(new_nums, j + 1, limit, true)
    else
      bubble_pass_with_flag(nums, j + 1, limit, swapped)
    end
  end

  def run() do
    nums = [4, 1, 3, 1, 5, 2]
    sorted_nums = bubble_sort(nums)
    IO.puts("After bubble sort, nums = [#{Enum.join(sorted_nums, ", ")}]")

    nums1 = [4, 1, 3, 1, 5, 2]
    sorted_nums1 = bubble_sort_with_flag(nums1)
    IO.puts("After bubble sort with flag, nums1 = [#{Enum.join(sorted_nums1, ", ")}]")
  end
end
