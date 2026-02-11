defmodule HelloAlgo.ChapterSorting.CountingSort do
  @moduledoc """
  File: CountingSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Simple counting sort (not stable)
  """
  def counting_sort_naive(nums) do
    if length(nums) == 0 do
      []
    else
      # 1. Find the maximum element m to determine the counter range
      m = Enum.max(nums)
      # 2. Count occurrences of each number
      counter = Enum.reduce(nums, %{}, fn num, acc ->
        Map.update(acc, num, 1, &(&1 + 1))
      end)
      # 3. Reconstruct the array by filling elements in order
      for num <- 0..m, count = Map.get(counter, num, 0), count > 0, _ <- 1..count do
        num
      end
    end
  end

  @doc """
  Complete counting sort (stable implementation)
  """
  def counting_sort(nums) do
    n = length(nums)
    if n == 0 do
      []
    else
      # 1. Find the maximum element m
      m = Enum.max(nums)

      # 2. Count occurrences
      counter = Enum.reduce(nums, List.duplicate(0, m + 1), fn num, acc ->
        val = Enum.at(acc, num)
        List.replace_at(acc, num, val + 1)
      end)

      # 3. Calculate prefix sums of the counter
      # counter[num] - 1 will be the index of the last occurrence of 'num' in the sorted array
      counter_prefix = Enum.scan(counter, 0, fn x, acc -> x + acc end)

      # 4. Build the result array by traversing the input array in reverse (stability)
      {res_map, _final_counter} = Enum.reduce(Enum.reverse(nums), {%{}, counter_prefix}, fn num, {res, counts} ->
        idx = Enum.at(counts, num) - 1
        new_res = Map.put(res, idx, num)
        new_counts = List.replace_at(counts, num, idx)
        {new_res, new_counts}
      end)

      # Copy the sorted results back to the original array (return it)
      for i <- 0..(n - 1), do: Map.get(res_map, i)
    end
  end

  def run() do
    nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    sorted_naive = counting_sort_naive(nums)
    IO.puts("After counting sort (naive), nums = [#{Enum.join(sorted_naive, ", ")}]")

    nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4]
    sorted_stable = counting_sort(nums1)
    IO.puts("After counting sort, nums1 = [#{Enum.join(sorted_stable, ", ")}]")
  end
end
