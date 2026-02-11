defmodule HelloAlgo.ChapterSorting.BucketSort do
  @moduledoc """
  File: BucketSort.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Bucket sort algorithm for floats in the range [0, 1)
  """
  def bucket_sort(nums) do
    n = length(nums)
    if n <= 1 do
      nums
    else
      # Initialize k = n/2 buckets
      k = max(1, div(n, 2))
      buckets = for _ <- 1..k, do: []

      # 1. Distribute elements into buckets based on their values
      buckets = Enum.reduce(nums, buckets, fn num, acc_buckets ->
        # Calculate bucket index
        i = floor(num * k)
        # Ensure index is within range [0, k-1]
        i = if i >= k, do: k - 1, else: i

        bucket = Enum.at(acc_buckets, i)
        List.replace_at(acc_buckets, i, bucket ++ [num])
      end)

      # 2. Sort each bucket individually and 3. Concatenate all sorted buckets
      buckets
      |> Enum.map(&Enum.sort/1)
      |> List.flatten()
    end
  end

  def run() do
    # Assume input data are floats in the range [0, 1)
    nums = [0.49, 0.96, 0.82, 0.09, 0.57, 0.43, 0.91, 0.75, 0.15, 0.37]
    sorted_nums = bucket_sort(nums)
    IO.puts("After bucket sort, nums = [#{Enum.join(sorted_nums, ", ")}]")
  end
end
