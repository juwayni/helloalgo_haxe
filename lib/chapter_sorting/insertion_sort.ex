defmodule HelloAlgo.ChapterSorting.InsertionSort do
  @moduledoc """
  File: InsertionSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Standard insertion sort algorithm (O(n^2))
  """
  def insertion_sort(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      # Outer loop starts from the second element
      do_insertion_sort(nums, 1, n)
    end
  end

  defp do_insertion_sort(nums, i, n) when i >= n, do: nums

  defp do_insertion_sort(nums, i, n) do
    base = Enum.at(nums, i)
    # Inner loop shifts elements to the right to make space for the base element
    new_nums = shift_and_insert(nums, i - 1, base)
    do_insertion_sort(new_nums, i + 1, n)
  end

  defp shift_and_insert(nums, j, base) when j >= 0 do
    val_j = Enum.at(nums, j)
    if val_j > base do
      # Shift val_j to the right (j + 1)
      new_nums = List.replace_at(nums, j + 1, val_j)
      shift_and_insert(new_nums, j - 1, base)
    else
      # Insert the base element at its correct sorted position
      List.replace_at(nums, j + 1, base)
    end
  end

  defp shift_and_insert(nums, _j, base) do
    # j < 0, insert base at index 0
    List.replace_at(nums, 0, base)
  end

  def run() do
    nums = [4, 1, 3, 1, 5, 2]
    sorted_nums = insertion_sort(nums)
    IO.puts("After insertion sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
