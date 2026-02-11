defmodule HelloAlgo.ChapterSorting.SelectionSort do
  @moduledoc """
  File: SelectionSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Standard selection sort algorithm (O(n^2))
  """
  def selection_sort(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      # Outer loop defines the start of the unsorted portion
      do_selection_sort(nums, 0, n)
    end
  end

  defp do_selection_sort(nums, i, n) when i >= n - 1, do: nums

  defp do_selection_sort(nums, i, n) do
    # Inner loop searches for the minimum element in the remaining unsorted portion
    k = find_min_index(nums, i + 1, n, i)
    # Swap the found minimum element with the first element of the unsorted portion
    new_nums = swap(nums, i, k)
    do_selection_sort(new_nums, i + 1, n)
  end

  defp find_min_index(_nums, j, n, k) when j >= n, do: k

  defp find_min_index(nums, j, n, k) do
    if Enum.at(nums, j) < Enum.at(nums, k) do
      find_min_index(nums, j + 1, n, j)
    else
      find_min_index(nums, j + 1, n, k)
    end
  end

  defp swap(nums, i, k) do
    if i == k do
      nums
    else
      val_i = Enum.at(nums, i)
      val_k = Enum.at(nums, k)

      nums
      |> List.replace_at(i, val_k)
      |> List.replace_at(k, val_i)
    end
  end

  def run() do
    nums = [4, 1, 3, 1, 5, 2]
    sorted_nums = selection_sort(nums)
    IO.puts("After selection sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
