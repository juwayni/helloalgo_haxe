defmodule HelloAlgo.ChapterSorting.HeapSort do
  @moduledoc """
  File: HeapSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Sift down the element at index i in a heap of size n to maintain the max-heap property
  """
  defp sift_down(nums, n, i) do
    curr = i
    l = 2 * curr + 1
    r = 2 * curr + 2
    ma = curr

    # Find the largest among current, left child, and right child
    ma = if l < n and Enum.at(nums, l) > Enum.at(nums, ma), do: l, else: ma
    ma = if r < n and Enum.at(nums, r) > Enum.at(nums, ma), do: r, else: ma

    # If the current node is already the largest, we are done
    if ma != curr do
      # Swap and continue sifting down
      val_curr = Enum.at(nums, curr)
      val_ma = Enum.at(nums, ma)
      new_nums =
        nums
        |> List.replace_at(curr, val_ma)
        |> List.replace_at(ma, val_curr)

      sift_down(new_nums, n, ma)
    else
      nums
    end
  end

  @doc """
  Perform heap sort on the given array
  """
  def heap_sort(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      # 1. Build a max-heap from the input array
      # Perform heapify for all non-leaf nodes in reverse order
      start_i = div(n, 2) - 1
      nums_heaped = Enum.reduce(start_i..0, nums, fn i, acc ->
        sift_down(acc, n, i)
      end)

      # 2. Iteratively extract the maximum element and rebuild the heap
      do_heap_sort(nums_heaped, n - 1)
    end
  end

  defp do_heap_sort(nums, 0), do: nums
  defp do_heap_sort(nums, j) do
    # Swap the root of the heap with the last element
    val_0 = Enum.at(nums, 0)
    val_j = Enum.at(nums, j)
    new_nums =
      nums
      |> List.replace_at(0, val_j)
      |> List.replace_at(j, val_0)

    # Sift down the new root to maintain the heap property in the reduced heap
    new_nums_sifted = sift_down(new_nums, j, 0)
    do_heap_sort(new_nums_sifted, j - 1)
  end

  def run() do
    nums = [4, 1, 3, 1, 5, 2]
    sorted_nums = heap_sort(nums)
    IO.puts("After heap sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
