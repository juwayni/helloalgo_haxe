defmodule HelloAlgo.ChapterComputationalComplexity.WorstBestTimeComplexity do
  @moduledoc """
  File: WorstBestTimeComplexity.ex
  Created Time: 2026-02-08
  Author: Ghazali (ghazalialshafi@gmail.com)
  """

  @doc """
  Generate an array with elements 1, 2, ..., n, and shuffle them randomly
  """
  def random_numbers(n) do
    nums = Enum.to_list(1..n)
    # Fisher-Yates shuffle algorithm
    shuffle(nums, length(nums) - 1)
  end

  defp shuffle(nums, 0), do: nums

  defp shuffle(nums, i) do
    j = :rand.uniform(i + 1) - 1
    temp_i = Enum.at(nums, i)
    temp_j = Enum.at(nums, j)

    nums
    |> List.replace_at(i, temp_j)
    |> List.replace_at(j, temp_i)
    |> shuffle(i - 1)
  end

  @doc """
  Search for the number 1 in the array and return its index.
  Best case: O(1) if 1 is at the first position.
  Worst case: O(n) if 1 is at the last position or not found.
  """
  def find_one(nums) do
    # Iterate through each element in the array
    Enum.find_index(nums, fn x -> x == 1 end) || -1
  end

  def run() do
    # Run several tests with shuffled arrays
    for _ <- 0..9 do
      n = 100
      nums = random_numbers(n)
      index = find_one(nums)
      IO.puts("\nArray [ 1, 2, ..., n ] after shuffling = [#{Enum.join(nums, ", ")}]")
      IO.puts("Index of number 1 is #{index}")
    end
  end
end
